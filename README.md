# Mobile Payments Analytics Dashboard  
**18 Years of Digital Money — Kenya (2007–2025)**  

From near-zero usage in March 2007 to over **KES 600+ billion moving every month** — this project tells the story of how mobile money evolved into core financial infrastructure.

One dataset. One transformation layer. One dashboard. One clear story.

---

## 🔗 View Dashboard
👉 [Click to view the full dashboard (Google Drive)](https://drive.google.com/file/d/1giLCBGaDBODOLrRIbEioFARGlqTZmQ9e/view?usp=sharing)

---

## 🧠 What This Project Answers

This is not just a dashboard — it’s a **focused analytics story** built on 227 months of data.

| Question | Insight |
|--------|--------|
| **How big has the platform become?** | Long-term growth from zero to billions in monthly transaction value |
| **What is the current transaction rhythm?** | Month-over-month trends reveal seasonal spikes (Dec) and dips (Jan) |
| **Are users transacting larger amounts?** | Average transaction size steadily increasing over time |
| **Is growth still strong or slowing?** | Year-over-year growth stabilizing, signaling market maturity |

No clutter. No unnecessary visuals. Every chart exists to answer a real question.

---

## Key Insights

- Mobile payments scaled from near-zero to **KES 600B+ monthly transactions**
- Average transaction size has steadily increased — indicating a shift beyond small P2P transfers
- Strong **seasonality pattern**: December peaks, January dips
- Growth is stabilizing → transition from hyper-growth to **mature infrastructure**

---

## 🛠️ Tech Stack
<img width="3197" height="569" alt="mobile_payments_stack drawio" src="https://github.com/user-attachments/assets/a1926452-9c94-42da-a819-4e2afdc17537" />


```text
Source Data      →   stg_mobilepayments (raw monthly data)
Transformation   →   dbt (mart_mobilepayments)
Analytics DB     →   DuckDB (via ODBC)
BI Layer         →   Power BI
Window Functions →   LAG(1) for MoM · LAG(12) for YoY
