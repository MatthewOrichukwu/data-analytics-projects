# Retail Sales Performance Review

> *Where does Superstore actually make its money — and where is it leaking?*

**Pillar:** Data & SQL
**Tools:** SQL Server (LocalDB), SSMS, Power BI Desktop
**Dataset:** [Sample Superstore (Kaggle)](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
**Status:** 🟨 In progress

---

## 1. The Business Context

Superstore is a US retailer selling furniture, office supplies and technology to consumer, corporate and home-office customers. Leadership has four years of order history (2014–2017) and wants a full performance review before setting next year's plan: what drives revenue, what drives profit, and where is the business losing money?

## 2. The Questions

1. Revenue by year and profit trend — is the business growing, and is profit keeping pace?
2. Revenue by sub-category vs profit margin — do our best sellers actually make us money?
3. Discount sensitivity and profit impact — is discounting buying growth or buying losses?
4. 2016–2017 customer retention and loyal customer valuation — who comes back, and what are they worth?
5. Regional shipping fulfilment by mode — how fast do we ship, and where are we slow?

**Data limitations:** Conversion analysis and competitor benchmarking are out of scope — the dataset contains completed orders only, with no website traffic or market data. Conversion will be addressed in a separate Google Analytics (GA4) case study.

## 3. The Approach
A companion Power BI dashboard visualises all five findings; see Behind the Scenes.

*A companion Power BI dashboard visualises all five findings; see Behind the Scenes.*

## 4. Key Findings

*To be completed.*

## 5. Recommendation

*To be completed.*

## 6. Behind the Scenes

- Initial CSV load failed because the Profit column contained missing values; staged all columns as nullable text, then validated and typed them in SQL.
- - Rebuilt the analysis as an interactive two-page Power BI dashboard connected to a SQL Server view (`vw_superstore_clean`), covering all five questions:
- Page 1 — Sales Performance: revenue & profit trend, sub-category profitability, and discount-band margin impact.
- Page 2 — Customer Retention & Value: 2016–2017 retention rate, repeat vs one-time customer value, and shipping speed by region and mode.
- [View the .pbix](../../powerbi/retail_sales_dashboard.pbix) [View the .pbix](../../powerbi/retail_sales_dashboard.pbix)
- SQL scripts: *links to be added.*

## 7. What I Learned

*To be completed.*# Retail Sales Performance Review

> *Where does Superstore actually make its money — and where is it leaking?*

**Pillar:** Data & SQL
**Tools:** SQL Server (LocalDB), SSMS
**Dataset:** [Sample Superstore (Kaggle)](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
**Status:** 🟨 In progress

---

## 1. The Business Context

Superstore is a US retailer selling furniture, office supplies and technology to consumer, corporate and home-office customers. Leadership has four years of order history (2014–2017) and wants a full performance review before setting next year's plan: what drives revenue, what drives profit, and where is the business losing money?

## 2. The Questions

1. Revenue by year and profit trend — is the business growing, and is profit keeping pace?
2. Revenue by sub-category vs profit margin — do our best sellers actually make us money?
3. Discount sensitivity and profit impact — is discounting buying growth or buying losses?
4. 2016–2017 customer retention and loyal customer valuation — who comes back, and what are they worth?
5. Regional shipping fulfilment by mode — how fast do we ship, and where are we slow?

**Data limitations:** Conversion analysis and competitor benchmarking are out of scope — the dataset contains completed orders only, with no website traffic or market data. Conversion will be addressed in a separate Google Analytics (GA4) case study.

## 3. The Approach

All analysis was performed in SQL Server against a single staged table of 9,994 order lines (2014–2017). Because the raw file was staged as text on import, dates and amounts are converted at query time with TRY_CAST.

- **Q1:** Aggregated order lines by year (GROUP BY), with revenue, profit, and margin as calculated measures.
- **Q2:** Same aggregation grouped by category and sub-category, ranked by revenue, to compare what sells against what earns.
- **Q3:** Bucketed every order line into discount bands (0%, 1–20%, 21–40%, 41%+) using CASE, then compared margin across bands.
- **Q4:** Measured retention by matching distinct 2016 customers against 2017 buyers (LEFT JOIN on customer ID), and compared average lifetime revenue of one-time vs repeat customers.
- **Q5:** Calculated average days between order and ship date (DATEDIFF) by region and ship mode.

Scripts: [01](01_revenue_profit_by_year.sql) · [02](02_subcategory_revenue_profit.sql) · [03](03_discount_profit_impact.sql) · [04](04_customer_retention.sql) · [05](05_shipping_by_region_mode.sql)

## 4. Key Findings

- **Superstore is a growth story, not a turnaround story.** Revenue grew 51% between 2014 and 2017 ($484K → $733K) and profit rose every year ($49.5K → $93.9K, +89%). Margin improved from 10.2% to ~13%, with a small slip to 12.8% in 2017.

- **2015 was the pivot year.** Revenue dipped slightly (−2.8%) while profit jumped 24% — consistent with a shift toward more profitable sales. Annual totals alone cannot confirm the cause; the discount findings below offer the most likely explanation.

- **The company sells tables at a loss — and has for four years.** The Tables sub-category runs a −8.4% margin on substantial revenue, with Bookcases (−3.0%) and Supplies (−2.5%) also loss-making. Margins across sub-categories range from −8.4% to +44.4% (Labels), meaning product mix matters far more than volume.

- **Deep discounting is the single biggest profit leak.** Undiscounted sales earn a 29.5% margin; margins fall in every discount band, and orders discounted 41%+ run at −49.9%. Those 1,139 deeply discounted order lines destroyed ~$122K of profit — equivalent to roughly 40% of all profit earned in the period. Discounting at this level is not buying growth; it is buying losses.

- **The customer base is exceptional — the problem is pricing, not loyalty.** 87.5% of 2016 customers returned in 2017, and repeat customers average $2,935 lifetime revenue vs $431 for one-time buyers (6.8x). Nearly all customers (781 of 793) are repeat buyers. (Note: with only 12 one-time customers, that comparison is indicative rather than robust.)

- **Operations are consistent and require no intervention.** Average days-to-ship is uniform across all four regions within each service class (Same Day ~0, First Class ~2.2, Second Class ~3.3, Standard ~5), with no regional outliers.

## 5. Recommendation

Superstore's growth and customer loyalty are genuine strengths; its profit leak is self-inflicted through pricing. Three actions, in priority order:

1. **Cap discounts.** Margins turn sharply negative beyond ~40% discount. Introduce an approval threshold above 30% and eliminate the 41%+ band except for clearance; this single change addresses a ~$122K cumulative leak.
2. **Fix or exit loss-making sub-categories.** Reprice, renegotiate supplier costs, or reduce the range in Tables and Bookcases. If margins cannot be lifted above zero, treat these as traffic drivers with strict volume limits — or discontinue.
3. **Protect the loyal base while raising prices.** With 87.5% retention, Superstore has more pricing power than its discounting behaviour suggests. Test reduced discounting on repeat customers, who demonstrably return regardless.

*Follow-up analysis recommended: a year-by-year sub-category mix view to confirm the driver of the 2015 margin step-up, and a web conversion analysis (separate GA4 case study) to cover the demand funnel this dataset cannot see.*

## 6. Behind the Scenes

- Initial CSV load failed because the Profit column contained missing values; staged all columns as nullable text, then validated and typed them in SQL with TRY_CAST.
- All five analysis scripts are in this folder, numbered in question order.
- Dataset: [Sample Superstore (Kaggle)](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final), 9,994 rows, 2014–2017.

## 7. What I Learned

- The gap between *what sells* and *what earns* is where the interesting findings live — revenue rankings and profit rankings tell different stories.
- Aggregates hide causes: annual totals suggested a hypothesis (the 2015 shift), but only more granular cuts (discount bands) could explain it. Stating clearly what the data *cannot* confirm is part of the job.
- Practical SQL: GROUP BY on multiple columns, calculated measures, CASE bucketing, subqueries, LEFT JOIN for cohort matching, DATEDIFF — plus the workflow of staging messy data as text and typing it at query time.

*To be completed as the analysis progresses.*

## 4. Key Findings

*Findings to date — from Q1 (revenue and profit trend). Updated as the analysis progresses.*

- **Superstore is a growth story, not a turnaround story.** Revenue grew 51% between 2014 and 2017 (from $484K to $733K), and profit rose every single year — from $49.5K to $93.9K, an 89% increase over the period.

- **The business became more profitable per round of revenue year, not just bigger.** Profit margin improved from 10.2% in 2014 to ~13% from 2015 onward, meaning profit increased faster than sales for most of the period.

- **2015 was the pivot year — and it raises the first open question.** Revenue dipped slightly (−2.8%) while profit jumped 24%, and margin stepped up from 10.2% to 13.1%. This pattern is consistent with a shift toward more profitable products or less discounting; the cause cannot be confirmed from annual totals alone and is tested in the sub-category analysis (Q2).

- **A watch item for 2017: margin slipped to 12.8% while revenue grew 20%.** The dip is small, but growth that arrives with eroding margin can signal discount-fuelled sales — investigated directly in the discount analysis (Q3).

*To be completed.*

## 5. Recommendation

*To be completed.*

## 6. Behind the Scenes

- Initial CSV load failed because the Profit column contained missing values; staged all columns as nullable text, then validated and typed them in SQL.
- SQL scripts: *links to be added.*

## 7. What I Learned

*To be completed.*


> *One-sentence business question this case study answers.*

**Pillar:** [Data & SQL / Python / Business Intelligence / AI in Business]
**Tools:** [e.g. SQL Server, Power BI]
**Dataset:** [Name + source link]
**Status:** [🟨 In progress / ✅ Complete]

---

## 1. The Business Context

Two or three sentences setting the scene, written for a non-technical reader.
Who is the (real or fictional) client? What decision are they trying to make?
What happens if they get it wrong?

*Example: "A mid-sized retailer has seen flat revenue for three quarters despite
growing customer numbers. Leadership wants to know where sales are leaking
before setting next year's budget."*

## 2. The Questions

The 3–5 specific questions the analysis set out to answer.

1. ...
2. ...
3. ...

## 3. The Approach

A short, plain-English description of what was done and why — no code here.
A reader should understand the logic of the analysis without knowing the tools.

*Example: "I joined transaction data with the product and store tables, then
compared revenue by region and quarter to isolate where the decline started."*

## 4. Key Findings

The 3–5 most important insights, each stated as a headline with one supporting
sentence. Lead with the finding, not the method.

- **Finding 1:** ...
- **Finding 2:** ...
- **Finding 3:** ...

## 5. Recommendation

What should the business actually do? One short paragraph or 2–3 bullet points.
This is the section a decision-maker would read first.

## 6. Behind the Scenes

*The technical detail, kept at the bottom on purpose.*

- Link to SQL scripts / notebooks / PBIX files in this folder
- Screenshots of dashboards or key visuals
- Any notable data cleaning or modelling decisions

## 7. What I Learned

One or two honest sentences — a skill gained, a mistake corrected, or something
you'd do differently. Recruiters consistently respond well to this.

---

*Part of the [Data Analytics & AI in Business portfolio](../README.md).*
