let
    // ---------------------------------------------------------------
    // 1. CONNECT to SharePoint list
    // ---------------------------------------------------------------
    Source = SharePoint.Tables(
        "https://thechildrensguild.sharepoint.com/sites/TCGLearningHub",
        [Implementation = "2.0", ViewMode = "All"]
    ),

    TNAResponses = Source{[Title = "TNAResponses"]}[Items],

    // ---------------------------------------------------------------
    // 2. REMOVE SharePoint metadata columns (keep only TNA columns)
    // ---------------------------------------------------------------
    SelectColumns = Table.SelectColumns(TNAResponses, {
        // Demographics
        "Role", "Site", "TenureTCG", "TenureField", "AgeGroups", "Credentials",

        // Behavioral Support
        "Beh_FBA", "Beh_BIP", "Beh_DeEsc", "Beh_PCM", "Beh_TIC",
        "Beh_PBIS", "Beh_Restorative", "Beh_DataCollection",
        "Beh_TBAStrategies", "Beh_Transitions", "Beh_AntiBullying",
        "Beh_SuicideRisk", "Beh_Elopement", "Beh_MedEmergency",

        // Classroom & Instruction
        "Cls_Differentiation", "Cls_Environment", "Cls_AccommodMod",
        "Cls_SEL", "Cls_AssistTech", "Cls_ProgressMon",
        "Cls_CoTeach", "Cls_PBL",

        // Related Services & IEP
        "IEP_GoalWriting", "IEP_TeacherCollab", "IEP_Caseload",
        "IEP_ServiceModels", "IEP_ProgressMon", "IEP_FamilyCoord",
        "IEP_Timelines",

        // Compliance
        "Comp_MandatedReporter", "Comp_FERPA", "Comp_Restraint",
        "Comp_SPEDLaw", "Comp_CARF", "Comp_IncidentReport",
        "Comp_MedAdmin",

        // Professional Skills
        "Prof_Boundaries", "Prof_FamilyComm", "Prof_CulturalDEI",
        "Prof_Teamwork", "Prof_CompassionFatigue", "Prof_Safety",
        "Prof_Technology", "Prof_TimeMgmt", "Prof_EscalatedFamily",

        // Closing
        "Satisfaction", "Priority1", "Priority2", "Priority3",
        "OpenTopic", "Onboarding_GapTopics", "PreferredFormat",
        "OpenComments",

        // Keep Created for time-based analysis
        "Created"
    }),

    // ---------------------------------------------------------------
    // 3. SET data types
    // ---------------------------------------------------------------
    SetTypes = Table.TransformColumnTypes(SelectColumns, {
        // Demographics
        {"Role", type text}, {"Site", type text},
        {"TenureTCG", type text}, {"TenureField", type text},
        {"AgeGroups", type text}, {"Credentials", type text},

        // All Likert columns as whole number
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

        {"IEP_GoalWriting", Int64.Type}, {"IEP_TeacherCollab", Int64.Type},
        {"IEP_Caseload", Int64.Type}, {"IEP_ServiceModels", Int64.Type},
        {"IEP_ProgressMon", Int64.Type}, {"IEP_FamilyCoord", Int64.Type},
        {"IEP_Timelines", Int64.Type},

        {"Comp_MandatedReporter", Int64.Type}, {"Comp_FERPA", Int64.Type},
        {"Comp_Restraint", Int64.Type}, {"Comp_SPEDLaw", Int64.Type},
        {"Comp_CARF", Int64.Type}, {"Comp_IncidentReport", Int64.Type},
        {"Comp_MedAdmin", Int64.Type},

        {"Prof_Boundaries", Int64.Type}, {"Prof_FamilyComm", Int64.Type},
        {"Prof_CulturalDEI", Int64.Type}, {"Prof_Teamwork", Int64.Type},
        {"Prof_CompassionFatigue", Int64.Type}, {"Prof_Safety", Int64.Type},
        {"Prof_Technology", Int64.Type}, {"Prof_TimeMgmt", Int64.Type},
        {"Prof_EscalatedFamily", Int64.Type},

        {"Satisfaction", Int64.Type},
        {"Priority1", type text}, {"Priority2", type text}, {"Priority3", type text},
        {"OpenTopic", type text}, {"Onboarding_GapTopics", type text},
        {"PreferredFormat", type text}, {"OpenComments", type text},
        {"Created", type datetimezone}
    }),

    // ---------------------------------------------------------------
    // 4. ADD friendly label columns for Role and Site
    // ---------------------------------------------------------------
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
        else if [Site] = "MAA" then "MAA"
        else if [Site] = "MAGB" then "MAGB"
        else if [Site] = "MGA_LAUREL" then "MGA Laurel"
        else if [Site] = "MPCP" then "MPCP"
        else if [Site] = "MULTI_SITE" then "Multi-Site"
        else [Site],
        type text
    ),

    // ---------------------------------------------------------------
    // 5. ADD ResponseID (row number for reference)
    // ---------------------------------------------------------------
    AddIndex = Table.AddIndexColumn(AddSiteLabel, "ResponseID", 1, 1, Int64.Type)

in
    AddIndex
