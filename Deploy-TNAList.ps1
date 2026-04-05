# =====================================================================
# Deploy-TNAList.ps1
# Creates TNAResponses list on TCG Learning Hub with all columns
# Run in pwsh 7 with PnP.PowerShell 1.12.0
# =====================================================================

# --- CONNECT ---
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# Import-Module PnP.PowerShell -RequiredVersion 1.12.0
# Connect-PnPOnline -Url "https://thechildrensguild.sharepoint.com/sites/TCGLearningHub" -UseWebLogin
# Get-PnPWeb

# --- CREATE LIST ---
New-PnPList -Title "TNAResponses" -Template GenericList -Url "Lists/TNAResponses"

# --- DEMOGRAPHICS ---
Add-PnPField -List "TNAResponses" -DisplayName "Role" -InternalName "Role" -Type Choice -Choices @([string[]]@("SPED_TEACHER","GEN_ED_TEACHER","TBA","TEACHER_ASST","SCHOOL_ADMIN","SOCIAL_WORKER","SLP","OT","SCHOOL_COUNSELOR","SUPPORT_STAFF"))
Add-PnPField -List "TNAResponses" -DisplayName "Campus / Site" -InternalName "Site" -Type Choice -Choices @([string[]]@("TCGDC","TCGPG","TCG_BALT","MAA","MAGB","MGA_LAUREL","MPCP","MULTI_SITE"))
Add-PnPField -List "TNAResponses" -DisplayName "Years at TCG" -InternalName "TenureTCG" -Type Choice -Choices @([string[]]@("LT1","1_3","4_7","8_PLUS"))
Add-PnPField -List "TNAResponses" -DisplayName "Years in Field" -InternalName "TenureField" -Type Choice -Choices @([string[]]@("LT1","1_3","4_7","8_15","16_PLUS"))
Add-PnPField -List "TNAResponses" -DisplayName "Age Groups" -InternalName "AgeGroups" -Type Text
Add-PnPField -List "TNAResponses" -DisplayName "Credentials" -InternalName "Credentials" -Type Text

# --- BEHAVIORAL SUPPORT (Number 0-5) ---
Add-PnPField -List "TNAResponses" -DisplayName "FBA" -InternalName "Beh_FBA" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "BIP" -InternalName "Beh_BIP" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "De-escalation" -InternalName "Beh_DeEsc" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "PCM" -InternalName "Beh_PCM" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Trauma-Informed" -InternalName "Beh_TIC" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "PBIS" -InternalName "Beh_PBIS" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Restorative Practices" -InternalName "Beh_Restorative" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Behavioral Data Collection" -InternalName "Beh_DataCollection" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "TBA Strategies" -InternalName "Beh_TBAStrategies" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Transitions" -InternalName "Beh_Transitions" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Anti-Bullying" -InternalName "Beh_AntiBullying" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Suicide Risk" -InternalName "Beh_SuicideRisk" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Elopement" -InternalName "Beh_Elopement" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Medical Emergency" -InternalName "Beh_MedEmergency" -Type Number

# --- CLASSROOM & INSTRUCTION (Number 0-5) ---
Add-PnPField -List "TNAResponses" -DisplayName "Differentiation" -InternalName "Cls_Differentiation" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Classroom Environment" -InternalName "Cls_Environment" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Accommodations/Modifications" -InternalName "Cls_AccommodMod" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "SEL" -InternalName "Cls_SEL" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Assistive Technology" -InternalName "Cls_AssistTech" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Progress Monitoring" -InternalName "Cls_ProgressMon" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Co-Teaching" -InternalName "Cls_CoTeach" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Project-Based Learning" -InternalName "Cls_PBL" -Type Number

# --- RELATED SERVICES & IEP (Number 0-5) ---
Add-PnPField -List "TNAResponses" -DisplayName "IEP Goal Writing" -InternalName "IEP_GoalWriting" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "IEP Teacher Collaboration" -InternalName "IEP_TeacherCollab" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Caseload Management" -InternalName "IEP_Caseload" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Service Delivery Models" -InternalName "IEP_ServiceModels" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "IEP Progress Monitoring" -InternalName "IEP_ProgressMon" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "IEP Family Coordination" -InternalName "IEP_FamilyCoord" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "IEP Timelines" -InternalName "IEP_Timelines" -Type Number

# --- COMPLIANCE (Number 0-5) ---
Add-PnPField -List "TNAResponses" -DisplayName "Mandated Reporting" -InternalName "Comp_MandatedReporter" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "FERPA" -InternalName "Comp_FERPA" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Restraint" -InternalName "Comp_Restraint" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "SPED Law" -InternalName "Comp_SPEDLaw" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "CARF" -InternalName "Comp_CARF" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Incident Reporting" -InternalName "Comp_IncidentReport" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Medication Administration" -InternalName "Comp_MedAdmin" -Type Number

# --- PROFESSIONAL SKILLS (Number 0-5) ---
Add-PnPField -List "TNAResponses" -DisplayName "Professional Boundaries" -InternalName "Prof_Boundaries" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Family Communication" -InternalName "Prof_FamilyComm" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Cultural Humility/DEI" -InternalName "Prof_CulturalDEI" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Teamwork" -InternalName "Prof_Teamwork" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Compassion Fatigue" -InternalName "Prof_CompassionFatigue" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Safety/Emergency Prep" -InternalName "Prof_Safety" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Technology Platforms" -InternalName "Prof_Technology" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Time Management" -InternalName "Prof_TimeMgmt" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Escalated Family Interactions" -InternalName "Prof_EscalatedFamily" -Type Number

# --- CLOSING ---
Add-PnPField -List "TNAResponses" -DisplayName "Satisfaction Rating" -InternalName "Satisfaction" -Type Number
Add-PnPField -List "TNAResponses" -DisplayName "Priority 1" -InternalName "Priority1" -Type Choice -Choices @([string[]]@("BEH_FBA","BEH_BIP","BEH_DEESC","BEH_PCM","BEH_TIC","BEH_PBIS","BEH_RESTORATIVE","BEH_DATA","BEH_TBA","BEH_ANTIBULLY","BEH_SUICIDE","BEH_ELOPEMENT","BEH_MEDEMERG","CLS_DIFF","CLS_ENV","CLS_ACCOM","CLS_SEL","CLS_TECH","CLS_COTEACH","CLS_PBL","IEP_GOALS","IEP_COLLAB","IEP_CASELOAD","IEP_SERVICE","IEP_PROGRESS","IEP_FAMILY","IEP_COMPLIANCE","COMP_MANDATE","COMP_FERPA","COMP_RESTRAINT","COMP_SPED_LAW","COMP_CARF","PROF_BOUND","PROF_FAMILY","PROF_DEI","PROF_FATIGUE","PROF_SAFETY","PROF_TECH","PROF_ESCALATED"))
Add-PnPField -List "TNAResponses" -DisplayName "Priority 2" -InternalName "Priority2" -Type Choice -Choices @([string[]]@("BEH_FBA","BEH_BIP","BEH_DEESC","BEH_PCM","BEH_TIC","BEH_PBIS","BEH_RESTORATIVE","BEH_DATA","BEH_TBA","BEH_ANTIBULLY","BEH_SUICIDE","BEH_ELOPEMENT","BEH_MEDEMERG","CLS_DIFF","CLS_ENV","CLS_ACCOM","CLS_SEL","CLS_TECH","CLS_COTEACH","CLS_PBL","IEP_GOALS","IEP_COLLAB","IEP_CASELOAD","IEP_SERVICE","IEP_PROGRESS","IEP_FAMILY","IEP_COMPLIANCE","COMP_MANDATE","COMP_FERPA","COMP_RESTRAINT","COMP_SPED_LAW","COMP_CARF","PROF_BOUND","PROF_FAMILY","PROF_DEI","PROF_FATIGUE","PROF_SAFETY","PROF_TECH","PROF_ESCALATED"))
Add-PnPField -List "TNAResponses" -DisplayName "Priority 3" -InternalName "Priority3" -Type Choice -Choices @([string[]]@("BEH_FBA","BEH_BIP","BEH_DEESC","BEH_PCM","BEH_TIC","BEH_PBIS","BEH_RESTORATIVE","BEH_DATA","BEH_TBA","BEH_ANTIBULLY","BEH_SUICIDE","BEH_ELOPEMENT","BEH_MEDEMERG","CLS_DIFF","CLS_ENV","CLS_ACCOM","CLS_SEL","CLS_TECH","CLS_COTEACH","CLS_PBL","IEP_GOALS","IEP_COLLAB","IEP_CASELOAD","IEP_SERVICE","IEP_PROGRESS","IEP_FAMILY","IEP_COMPLIANCE","COMP_MANDATE","COMP_FERPA","COMP_RESTRAINT","COMP_SPED_LAW","COMP_CARF","PROF_BOUND","PROF_FAMILY","PROF_DEI","PROF_FATIGUE","PROF_SAFETY","PROF_TECH","PROF_ESCALATED"))
Add-PnPField -List "TNAResponses" -DisplayName "Open Topic" -InternalName "OpenTopic" -Type Note
Add-PnPField -List "TNAResponses" -DisplayName "Onboarding Gaps" -InternalName "Onboarding_GapTopics" -Type Note
Add-PnPField -List "TNAResponses" -DisplayName "Preferred Format" -InternalName "PreferredFormat" -Type Text
Add-PnPField -List "TNAResponses" -DisplayName "Open Comments" -InternalName "OpenComments" -Type Note

# --- VERIFY ---
Get-PnPField -List "TNAResponses" | Select-Object InternalName, TypeAsString | Sort-Object InternalName

# --- VIEWS ---
# Default view: All Responses, sorted by Created descending
Add-PnPView -List "TNAResponses" -Title "All Responses" -Fields @("Role","Site","TenureTCG","Satisfaction","Priority1","Created") -SetAsDefault -Query '<OrderBy><FieldRef Name="Created" Ascending="FALSE" /></OrderBy>'

# By Campus view: grouped by Site
Add-PnPView -List "TNAResponses" -Title "By Campus" -Fields @("Role","TenureTCG","Satisfaction","Priority1","Created") -Query '<GroupBy Collapse="TRUE"><FieldRef Name="Site" /></GroupBy><OrderBy><FieldRef Name="Created" Ascending="FALSE" /></OrderBy>'

# By Role view: grouped by Role
Add-PnPView -List "TNAResponses" -Title "By Role" -Fields @("Site","TenureTCG","Satisfaction","Priority1","Created") -Query '<GroupBy Collapse="TRUE"><FieldRef Name="Role" /></GroupBy><OrderBy><FieldRef Name="Created" Ascending="FALSE" /></OrderBy>'
