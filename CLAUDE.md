# CLAUDE.md — TCG Training Needs Assessment (TNA)

## Project Overview
Training Needs Assessment platform for The Children's Guild. Survey form collects team member self-ratings across 45 training topics (5-point Likert scale), demographic data, priority rankings, and open-ended feedback.

## Architecture

### Phase 1 — SharePoint List
- **List:** TNAResponses on TCG Learning Hub
- **Columns:** 60+ (demographics, 45 Likert scores, priorities, open text)
- **Views:** All Responses, By Campus, By Role
- **Deploy script:** `Deploy-TNAList.ps1`

### Phase 2 — Power Automate Flow
- **Flow:** TCG-TNA-Submit (HTTP trigger → PostItem)
- **Definition:** `flow-tna-submit-definition.json`
- **Deploy script:** `Deploy-TNAFlow.ps1`

### Phase 3 — Survey Form
- **Live URL:** https://thechildrensguild.github.io/tcg-tna/
- **File:** `index.html` (GitHub Pages, single-file form)
- **Repo:** thechildrensguild/tcg-tna (public GitHub org)

### Phase 4 — Power BI Dashboard (in progress)
- **File:** `TNA-Dashboard.pbip` (Power BI Project format)
- **Format:** PBIP with editable JSON visual definitions
- **Semantic model:** 3 queries + 13 DAX measures

## Power BI Data Model

### Queries (3 total)
| Query | Source | Purpose |
|---|---|---|
| TNAResponses | SharePoint list (Implementation 2.0, display names → renamed to internal) | Main response table with demographics, scores, priorities |
| LikertScores | References TNAResponses, unpivoted | Fact table: one row per respondent per topic (TopicCode, Score, Section, TopicLabel) |
| PriorityTopics | Hardcoded lookup | Maps priority codes to display names and sections |

### IMPORTANT: SharePoint column name issue
Power BI's SharePoint connector with `Implementation = "2.0"` returns **display names**, not internal names. The TNAResponses query uses display names in SelectColumns, then a RenameColumns step maps them back to internal names (e.g., "Campus / Site" → "Site", "FBA" → "Beh_FBA"). The corrected query is in `PowerQuery_TNAResponses_v2.m`.

### DAX Measures (13 total, on LikertScores table)
Response Count, Completion Rate, Avg Score, Avg Score (excl NA), Valid Responses, Pct Low Confidence, Pct High Confidence, Need Level, Section Avg, Priority Mentions, Priority Weighted Score, Avg Satisfaction, Satisfaction Distribution

### Report Pages (4 pages, defined in PBIR JSON)
1. **Executive Summary** — 3 cards (Response Count, Avg Satisfaction, Completion Rate), bar chart (Avg Score by Section), 2 slicers (Site, Role)
2. **Training Needs Detail** — bar chart (% Low Confidence by TopicLabel), 3 slicers (Section, Site, Role)
3. **Priority Analysis** — 2 bar charts (Priority Weighted Score, Priority Mentions by TopicLabel from PriorityTopics)
4. **Demographics & Comments** — 2 donut charts (Role, Site distribution), table (OpenTopic, OpenComments)

## Key Files
| File | Purpose |
|---|---|
| `index.html` | Production survey form (GitHub Pages) |
| `Deploy-TNAList.ps1` | PnP list creation script |
| `flow-tna-submit-definition.json` | Power Automate flow definition |
| `Deploy-TNAFlow.ps1` | Flow deployment script |
| `PowerQuery_TNAResponses.m` | Original Power Query (uses internal names — BROKEN in Power BI) |
| `PowerQuery_TNAResponses_v2.m` | Fixed Power Query (uses display names + rename step — USE THIS) |
| `PowerQuery_LikertScores_Unpivoted.m` | Unpivoted fact table query |
| `PowerQuery_PriorityTopics_Lookup.m` | Priority code lookup table |
| `DAX_Measures.dax` | All 13 DAX measures |
| `TNA-Dashboard.pbip` | Power BI Project file (open this to load dashboard) |
| `TNA-Dashboard.Report/` | PBIR report definition (pages, visuals as JSON) |
| `TNA-Dashboard.SemanticModel/` | TMDL semantic model (tables, measures, queries) |

## Remaining Tasks
1. Fix PBIR visual schema version (was 2.5.0, needs to match installed Power BI version)
2. Sort bar charts (descending by value) in Power BI GUI
3. Format Completion Rate as percentage, Avg Satisfaction to 1 decimal
4. Apply TCG brand colors to visuals
5. Delete test items from TNAResponses list before sharing with staff
6. Publish to Power BI workspace (requires Pro license)

## Status
Phases 1-3 complete and tested end-to-end. Phase 4 (Power BI) has data model complete (queries + measures working), report layout defined in PBIR JSON but needs visual schema version fix for current Power BI Desktop version.
