# Retail Sales Performance Review

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

*To be completed as the analysis progresses.*

## 4. Key Findings

*To be completed.*

## 5. Recommendation

*To be completed.*

## 6. Behind the Scenes

- Initial CSV load failed because the Profit column contained missing values; staged all columns as nullable text, then validated and typed them in SQL.
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

Aggregated 9,994 order lines by year using GROUP BY, with revenue, profit, and profit margin as calculated measures (SQL Server). Because the raw file was staged as text on import, dates and amounts are converted at query time with TRY_CAST. *Approach notes for Q2–Q5 to follow.*

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
