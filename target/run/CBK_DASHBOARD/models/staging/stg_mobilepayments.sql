
  
  create view "CBK_DASHBOARD"."main"."stg_mobilepayments__dbt_tmp" as (
    select
    date(
        cast(Year as varchar) || '-' ||
        case Month
            when 'January' then '01'
            when 'February' then '02'
            when 'March' then '03'
            when 'April' then '04'
            when 'May' then '05'
            when 'June' then '06'
            when 'July' then '07'
            when 'August' then '08'
            when 'September' then '09'
            when 'October' then '10'
            when 'November' then '11'
            when 'December' then '12'
        end || '-01'
    ) as period,
    "Active Agents" as active_agents,
    "Total Registered Mobile Money Accounts (Millions)" as registered_accounts_millions,
    "Total Agent Cash in Cash Out (Volume Million)" as txn_volume_million,
    "Total Agent Cash in Cash Out (Value KSh billions)" as txn_value_billion
from "CBK_DASHBOARD"."main"."MobilePayments"
where Year is not null
  );
