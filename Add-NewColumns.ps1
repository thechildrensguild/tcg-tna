# Add new columns to TNAResponses list (v2 form enhancements)
# Run in pwsh 7 after: Connect-PnPOnline -Url "https://thechildrensguild.sharepoint.com/sites/TCGLearningHub" -UseWebLogin

# --- Update Site choices (remove MAA, MAGB, MGA_LAUREL; add TCG_TA) ---
Set-PnPField -List "TNAResponses" -Identity "Site" -Values @{Choices=@("TCGDC","TCGPG","TCG_BALT","TCG_TA","MPCP","MULTI_SITE")}

# --- New demographic fields ---
Add-PnPField -List "TNAResponses" -DisplayName "Years in Current Role" -InternalName "YearsCurrentRole" -Type Choice -Choices @([string[]]@("LT1","1_3","4_7","8_PLUS"))
Add-PnPField -List "TNAResponses" -DisplayName "Education Level" -InternalName "EducationLevel" -Type Choice -Choices @([string[]]@("HS_DIPLOMA","GED","SOME_COLLEGE","ASSOCIATES","BACHELORS","MASTERS","DOCTORATE","ENROLLED"))
Add-PnPField -List "TNAResponses" -DisplayName "Supervisory" -InternalName "Supervisory" -Type Choice -Choices @([string[]]@("YES","NO"))

# --- New Likert columns (Classroom) ---
Add-PnPField -List "TNAResponses" -DisplayName "Sensory Processing" -InternalName "Cls_Sensory" -Type Number

# --- New Likert columns (IEP) ---
Add-PnPField -List "TNAResponses" -DisplayName "IEP Classifications" -InternalName "IEP_Classifications" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Reading an IEP" -InternalName "IEP_ReadIEP" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Evidence-Based Interventions" -InternalName "IEP_EvidenceBased" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Transition Planning" -InternalName "IEP_Transition" -Type Number

# --- New Likert columns (Compliance) — replace CARF ---
Add-PnPField -List "TNAResponses" -DisplayName "HIPAA" -InternalName "Comp_HIPAA" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Regulatory (COMAR/OSSE)" -InternalName "Comp_Regulatory" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Documentation" -InternalName "Comp_Documentation" -Type Number

# --- New Likert columns (Professional) ---
Add-PnPField -List "TNAResponses" -DisplayName "Conflict Resolution" -InternalName "Prof_ConflictRes" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Brain Science" -InternalName "Prof_BrainScience" -Type Number

# --- New closing section fields (stored as comma-separated text) ---
Add-PnPField -List "TNAResponses" -DisplayName "Preferred Times" -InternalName "PreferredTimes" -Type Note
Add-PnPField -List "TNAResponses" -DisplayName "Barriers" -InternalName "Barriers" -Type Note
Add-PnPField -List "TNAResponses" -DisplayName "Previous Training" -InternalName "PreviousTraining" -Type Note
Add-PnPField -List "TNAResponses" -DisplayName "Mentor Topics" -InternalName "MentorTopics" -Type Note

# --- Verify all new columns ---
Get-PnPField -List "TNAResponses" | Where-Object { $_.InternalName -in @("YearsCurrentRole","EducationLevel","Supervisory","Cls_Sensory","IEP_Classifications","IEP_ReadIEP","IEP_EvidenceBased","IEP_Transition","Comp_HIPAA","Comp_COMAR","Comp_OSSE","Comp_Documentation","Prof_ConflictRes","Prof_BrainScience","PreferredTimes","Barriers","PreviousTraining","MentorTopics") } | Select-Object InternalName, TypeAsString, Title
