This repository contains the data and code that was used in our paper published at Journal of Accounting Research. If you use our data and code in your research, please cite our paper as follows:

- Yang Bao, Bin Ke, Bin Li, Julia Yu, and Jie Zhang. Detecting Accounting Fraud in Publicly Traded U.S. Firms Using a Machine Learning Approach. Journal of Accounting Research, Accepted.

### Data Description Sheet for the paper “Detecting Accounting Fraud in Publicly Traded U.S. Firms: A New Perspective and a New Method” by Yang Bao, Bin Ke, Bin Li, Y. Julia Yu, and Jie Zhang (November 2019)

*1. A description of which author(s) handled the data and conducted the analyses.*

  Yang Bao and Julia Yu handled data. Yang Bao, Bin Ke, and Julia Yu jointly conducted the analyses.

*2. A detailed description of how the raw data were obtained or generated, including data sources, the specific date(s) on which data were downloaded or obtained, and the instrument used to generate the data (e.g., for surveys or experiments). We recommend that more than one author is able to vouch for the stated source of the raw data.*

  Our accounting fraud sample comes from the SEC’s Accounting and Auditing Enforcement Releases (AAERs) provided by the University of California-Berkeley Center for Financial Reporting and Management (CFRM). The version of the CFRM database we obtained in March 2017 covers the period from May 17, 1982 to September 30, 2016. Since the CFRM has not updated its database ever since, we hand collected additional fraud observations from the SEC website (https://www.sec.gov/divisions/enforce/friactions.shtml) for the period up to December 31, 2018 (AAER #4012).

  The raw financial statement data items are from the Compustat Fundamental file in WRDS (accessed on February 20, 2019).

  All the authors vouch for the stated source of the raw data and have access to the data.

*3. If the data are obtained from an organization on a proprietary basis, the authors should privately provide the editors with contact information for a representative of the organization who can confirm data were obtained by the authors. The editors would not make this information publicly available. The authors should also provide information to the editors about the data sharing agreement with the organization (e.g., non-disclosure agreements, any restrictions imposed by the organization on the authors, such as restrictions to publish certain results).*

  Not Applicable.

*4. A complete description of the steps necessary to collect and process the data used in the final analyses reported in the paper. For experimental and survey papers, we require information about the instructions and instruments used to generate the data, subject eligibility and/or selection, as well as any exclusion criteria. The full set of instructions and instruments can be provided in the online appendix.*

We detail the data collection and processing in Section 3 “The Sample and Data” of the paper, and make our final dataset publicly available as described below.

*5. The computer programs or code used to convert the raw data into the final dataset used in the analysis plus a brief description that enables other researchers to use this program. The purpose of this requirement is to facilitate replication and to help other researchers understand in detail how the raw data were processed, the final sample was formed, variables were defined, outliers were treated, etc. This code or programming is in most circumstances not proprietary. However, we recognize that some parts of the code or data generation process may be proprietary, including from the authors’ perspective. Therefore, instead of the code or program, researchers can provide a detailed step-by-step description of the code or the relevant parts of the code such that it enables other researchers to arrive at the same final dataset used in the analysis. In such cases, the authors should inform the editors upon initial submission, so that the editors can consider an exemption from the code sharing requirement. Whenever feasible, authors should also provide the identifiers (e.g., CIK, CUSIP) for their final sample. Authors should consult our FAQ Sheet on the JAR website for further details.*

  We make the data and code used in this paper publicly available in our Github repository (https://github.com/JarFraud/FraudDetection).

  The file “run_RUSBoost28.m” is a Matlab program to replicate the results of our proposed fraud detection model in the paper. To run this program, two additional Matlab files are required: (1) the file “data_reader.m” for reading the data, and (2) the file “evaluate.m” for evaluating model performance.

  The file “uscecchini28.csv” is our final dataset. The variable name of our fraud label is “misstate” (1 denotes fraud, and 0 denotes non-fraud). The variable names of the 28 raw financial data items are: act, ap, at, ceq, che, cogs, csho, dlc, dltis, dltt, dp, ib, invt, ivao, ivst, lct, lt, ni, ppegt, pstk, re, rect, sale, sstk, txp, txt, xint, prcc_f. The variable name of 14 financial ratios are: dch_wc, ch_rsst, dch_rec, dch_inv, soft_assets, ch_cs, ch_cm, ch_roa, issue, bm, dpi, reoa, EBIT, ch_fcf. The variable “new_p_aaer” is used for identifying serial frauds as described in Section 3.3 (see the code in “RUSBoost28.m” for more details).

  The file “identifiers.csv” contains the identifiers (i.e., gvkey and fyear) of firm-year observations in our sample.

*6. An assurance that the data and programs will be maintained by at least one author (usually the corresponding author) for at least six years, consistent with National Science Foundation guidelines.*

  The authors will retain the data and programs for the required six years.
