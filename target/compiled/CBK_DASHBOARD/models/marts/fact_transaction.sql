with staging as (
    select *
    from "CBK_DASHBOARD"."main"."stg_mobilepayments"
),

base as (
    select
        period,
        date_trunc('year', period) as year,

        txn_value_billion,
        txn_volume_million,
        active_agents,
        registered_accounts_millions,

        -- Previous values
        lag(txn_value_billion) over (order by period) as prev_month_value,
        lag(txn_value_billion, 12) over (order by period) as prev_year_value,
        lag(txn_volume_million, 12) over (order by period) as prev_year_volume

    from staging
)

select
    period,
    year,

    txn_value_billion,
    txn_volume_million,
    active_agents,
    registered_accounts_millions,

    -- MoM %
    case 
        when prev_month_value is null or prev_month_value = 0 then null
        else (txn_value_billion - prev_month_value) / prev_month_value
    end as mom_value_pct,

    -- YoY % (monthly base)
    case 
        when prev_year_value is null or prev_year_value = 0 then null
        else (txn_value_billion - prev_year_value) / prev_year_value
    end as yoy_value_pct,

    case 
        when prev_year_volume is null or prev_year_volume = 0 then null
        else (txn_volume_million - prev_year_volume) / prev_year_volume
    end as yoy_volume_pct,

    -- Avg Transaction Size (KES)
    case 
        when txn_volume_million = 0 or txn_volume_million is null then null
        else (txn_value_billion / txn_volume_million) * 1000
    end as avg_txn_size_kes

from base
order by period