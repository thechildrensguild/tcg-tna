let
    Source = SharePoint.Tables(
        "https://thechildrensguild.sharepoint.com/sites/TCGLearningHub",
        [Implementation = "2.0", ViewMode = "All"]
    ),

    TNAResponses = Source{[Title = "TNAResponses"]}[Items],

    SelectColumns = Table.SelectColumns(TNAResponses, {
        "Role", "Campus / Site", "Years at TCG", "Years in Field", "Age Groups", "Credentials",
        "Years in Current Role", "Education Level", "Supervisory",
        "FBA", "BIP", "De-escalation", "PCM", "Trauma-Informed",
        "PBIS", "Restorative Practices", "Behavioral Data Collection",
        "TBA Strategies", "Transitions", "Anti-Bullying",
        "Suicide Risk", "Elopement", "Medical Emergency",
        "Differentiation", "Classroom Environment", "Accommodations/Modifications",
        "SEL", "Assistive Technology", "Progress Monitoring",
        "Co-Teaching", "Project-Based Learning", "Sensory Processing",
        "IEP Goal Writing", "IEP Teacher Collaboration", "Caseload Management",
        "Service Delivery Models", "IEP Progress Monitoring", "IEP Family Coordination",
        "IEP Timelines", "IEP Classifications", "Reading an IEP",
        "Evidence-Based Interventions", "Transition Planning",
        "Mandated Reporting", "FERPA", "Restraint",
        "SPED Law", "HIPAA", "COMAR/MSDE Regulations", "OSSE/DCPS Regulations",
        "Documentation", "Incident Reporting", "Medication Administration",
        "Professional Boundaries", "Family Communication", "Cultural Humility/DEI",
        "Teamwork", "Compassion Fatigue", "Safety/Emergency Prep",
        "Technology Platforms", "Time Management", "Escalated Family Interactions",
        "Conflict Resolution", "Brain Science",
        "Satisfaction Rating", "Priority 1", "Priority 2", "Priority 3",
        "Open Topic", "Onboarding Gaps", "Preferred Format",
        "Open Comments", "Preferred Times", "Barriers",
        "Previous Training", "Mentor Topics",
        "Created"
    }),

    RenameColumns = Table.RenameColumns(SelectColumns, {
        {"Campus / Site", "Site"},
        {"Years at TCG", "TenureTCG"},
        {"Years in Field", "TenureField"},
        {"Age Groups", "AgeGroups"},
        {"Years in Current Role", "YearsCurrentRole"},
        {"Education Level", "EducationLevel"},
        {"FBA", "Beh_FBA"},
        {"BIP", "Beh_BIP"},
        {"De-escalation", "Beh_DeEsc"},
        {"PCM", "Beh_PCM"},
        {"Trauma-Informed", "Beh_TIC"},
        {"PBIS", "Beh_PBIS"},
        {"Restorative Practices", "Beh_Restorative"},
        {"Behavioral Data Collection", "Beh_DataCollection"},
        {"TBA Strategies", "Beh_TBAStrategies"},
        {"Transitions", "Beh_Transitions"},
        {"Anti-Bullying", "Beh_AntiBullying"},
        {"Suicide Risk", "Beh_SuicideRisk"},
        {"Elopement", "Beh_Elopement"},
        {"Medical Emergency", "Beh_MedEmergency"},
        {"Differentiation", "Cls_Differentiation"},
        {"Classroom Environment", "Cls_Environment"},
        {"Accommodations/Modifications", "Cls_AccommodMod"},
        {"SEL", "Cls_SEL"},
        {"Assistive Technology", "Cls_AssistTech"},
        {"Progress Monitoring", "Cls_ProgressMon"},
        {"Co-Teaching", "Cls_CoTeach"},
        {"Project-Based Learning", "Cls_PBL"},
        {"Sensory Processing", "Cls_Sensory"},
        {"IEP Goal Writing", "IEP_GoalWriting"},
        {"IEP Teacher Collaboration", "IEP_TeacherCollab"},
        {"Caseload Management", "IEP_Caseload"},
        {"Service Delivery Models", "IEP_ServiceModels"},
        {"IEP Progress Monitoring", "IEP_ProgressMon"},
        {"IEP Family Coordination", "IEP_FamilyCoord"},
        {"IEP Timelines", "IEP_Timelines"},
        {"IEP Classifications", "IEP_Classifications"},
        {"Reading an IEP", "IEP_ReadIEP"},
        {"Evidence-Based Interventions", "IEP_EvidenceBased"},
        {"Transition Planning", "IEP_Transition"},
        {"Mandated Reporting", "Comp_MandatedReporter"},
        {"FERPA", "Comp_FERPA"},
        {"Restraint", "Comp_Restraint"},
        {"SPED Law", "Comp_SPEDLaw"},
        {"HIPAA", "Comp_HIPAA"},
        {"COMAR/MSDE Regulations", "Comp_COMAR"},
        {"OSSE/DCPS Regulations", "Comp_OSSE"},
        {"Documentation", "Comp_Documentation"},
        {"Incident Reporting", "Comp_IncidentReport"},
        {"Medication Administration", "Comp_MedAdmin"},
        {"Professional Boundaries", "Prof_Boundaries"},
        {"Family Communication", "Prof_FamilyComm"},
        {"Cultural Humility/DEI", "Prof_CulturalDEI"},
        {"Teamwork", "Prof_Teamwork"},
        {"Compassion Fatigue", "Prof_CompassionFatigue"},
        {"Safety/Emergency Prep", "Prof_Safety"},
        {"Technology Platforms", "Prof_Technology"},
        {"Time Management", "Prof_TimeMgmt"},
        {"Escalated Family Interactions", "Prof_EscalatedFamily"},
        {"Conflict Resolution", "Prof_ConflictRes"},
        {"Brain Science", "Prof_BrainScience"},
        {"Satisfaction Rating", "Satisfaction"},
        {"Priority 1", "Priority1"},
        {"Priority 2", "Priority2"},
        {"Priority 3", "Priority3"},
        {"Open Topic", "OpenTopic"},
        {"Onboarding Gaps", "Onboarding_GapTopics"},
        {"Preferred Format", "PreferredFormat"},
        {"Open Comments", "OpenComments"},
        {"Preferred Times", "PreferredTimes"},
        {"Previous Training", "PreviousTraining"},
        {"Mentor Topics", "MentorTopics"}
    }),

    SetTypes = Table.TransformColumnTypes(RenameColumns, {
        {"Role", type text}, {"Site", type text},
        {"TenureTCG", type text}, {"TenureField", type text},
        {"AgeGroups", type text}, {"Credentials", type text},
        {"YearsCurrentRole", type text}, {"EducationLevel", type text},
        {"Supervisory", type text},
        {"Beh_FBA", Int64.Type}, {"Beh_BIP", Int64.Type},
        {"Beh_DeEsc", Int64.Type}, {"Beh_PCM", Int64.Type},
        {"Beh_TIC", Int64.Type}, {"Beh_PBIS", Int64.Type},
        {"Beh_Restorative", Int64.Type}, {"Beh_DataCollection", Int64.Type},
        {"Beh_TBAStrategies", Int64.Type}, {"Beh_Transitions", Int64.Type},
        {"Beh_AntiBullying", Int64.Type}, {"Beh_SuicideRisk", Int64.Type},
        {"Beh_Elopement", Int64.Type}, {"Beh_MedEmergency", Int64.Type},
        {"Cls_Differentiation", Int64.Type}, {"Cls_Environment", Int64.Type},
        {"Cls_AccommodMod", Int64.Type}, {"Cls_SEL", Int64.Type},
        {"Cls_AssistTech", Int64.Type}, {"Cls_ProgressMon", Int64.Type},
        {"Cls_CoTeach", Int64.Type}, {"Cls_PBL", Int64.Type},
        {"Cls_Sensory", Int64.Type},
        {"IEP_GoalWriting", Int64.Type}, {"IEP_TeacherCollab", Int64.Type},
        {"IEP_Caseload", Int64.Type}, {"IEP_ServiceModels", Int64.Type},
        {"IEP_ProgressMon", Int64.Type}, {"IEP_FamilyCoord", Int64.Type},
        {"IEP_Timelines", Int64.Type},
        {"IEP_Classifications", Int64.Type}, {"IEP_ReadIEP", Int64.Type},
        {"IEP_EvidenceBased", Int64.Type}, {"IEP_Transition", Int64.Type},
        {"Comp_MandatedReporter", Int64.Type}, {"Comp_FERPA", Int64.Type},
        {"Comp_Restraint", Int64.Type}, {"Comp_SPEDLaw", Int64.Type},
        {"Comp_HIPAA", Int64.Type}, {"Comp_COMAR", Int64.Type},
        {"Comp_OSSE", Int64.Type}, {"Comp_Documentation", Int64.Type},
        {"Comp_IncidentReport", Int64.Type}, {"Comp_MedAdmin", Int64.Type},
        {"Prof_Boundaries", Int64.Type}, {"Prof_FamilyComm", Int64.Type},
        {"Prof_CulturalDEI", Int64.Type}, {"Prof_Teamwork", Int64.Type},
        {"Prof_CompassionFatigue", Int64.Type}, {"Prof_Safety", Int64.Type},
        {"Prof_Technology", Int64.Type}, {"Prof_TimeMgmt", Int64.Type},
        {"Prof_EscalatedFamily", Int64.Type},
        {"Prof_ConflictRes", Int64.Type}, {"Prof_BrainScience", Int64.Type},
        {"Satisfaction", Int64.Type},
        {"Priority1", type text}, {"Priority2", type text}, {"Priority3", type text},
        {"OpenTopic", type text}, {"Onboarding_GapTopics", type text},
        {"PreferredFormat", type text}, {"OpenComments", type text},
        {"PreferredTimes", type text}, {"Barriers", type text},
        {"PreviousTraining", type text}, {"MentorTopics", type text},
        {"Created", type datetimezone}
    }),

    AddRoleLabel = Table.AddColumn(SetTypes, "RoleLabel", each
        if [Role] = "SPED_TEACHER" then "SPED Teacher"
        else if [Role] = "GEN_ED_TEACHER" then "Gen Ed Teacher"
        else if [Role] = "TBA" then "TBA"
        else if [Role] = "TEACHER_ASST" then "Teacher Assistant"
        else if [Role] = "SCHOOL_ADMIN" then "School Admin"
        else if [Role] = "SOCIAL_WORKER" then "Social Worker"
        else if [Role] = "SLP" then "SLP"
        else if [Role] = "OT" then "OT"
        else if [Role] = "SCHOOL_COUNSELOR" then "School Counselor"
        else if [Role] = "SUPPORT_STAFF" then "Support Staff"
        else [Role],
        type text
    ),

    AddSiteLabel = Table.AddColumn(AddRoleLabel, "SiteLabel", each
        if [Site] = "TCGDC" then "TCG DC"
        else if [Site] = "TCGPG" then "TCG PG"
        else if [Site] = "TCG_BALT" then "TCG Baltimore"
        else if [Site] = "TCG_TA" then "Transformation Academy"
        else if [Site] = "MPCP" then "MPCP"
        else if [Site] = "MULTI_SITE" then "Multi-Site"
        else [Site],
        type text
    ),

    AddIndex = Table.AddIndexColumn(AddSiteLabel, "ResponseID", 1, 1, Int64.Type)

in
    AddIndex
