let
    Source = TNAResponses,

    KeepColumns = Table.SelectColumns(Source, {
        "ResponseID", "Role", "RoleLabel", "Site", "SiteLabel",
        "TenureTCG", "TenureField", "YearsCurrentRole", "EducationLevel", "Supervisory",

        // Behavioral
        "Beh_FBA", "Beh_BIP", "Beh_DeEsc", "Beh_PCM", "Beh_TIC",
        "Beh_PBIS", "Beh_Restorative", "Beh_DataCollection",
        "Beh_TBAStrategies", "Beh_Transitions", "Beh_AntiBullying",
        "Beh_SuicideRisk", "Beh_Elopement", "Beh_MedEmergency",

        // Classroom
        "Cls_Differentiation", "Cls_Environment", "Cls_AccommodMod",
        "Cls_SEL", "Cls_AssistTech", "Cls_ProgressMon",
        "Cls_CoTeach", "Cls_PBL", "Cls_Sensory",

        // IEP
        "IEP_GoalWriting", "IEP_TeacherCollab", "IEP_Caseload",
        "IEP_ServiceModels", "IEP_ProgressMon", "IEP_FamilyCoord",
        "IEP_Timelines", "IEP_Classifications", "IEP_ReadIEP",
        "IEP_EvidenceBased", "IEP_Transition",

        // Compliance
        "Comp_MandatedReporter", "Comp_FERPA", "Comp_Restraint",
        "Comp_SPEDLaw", "Comp_HIPAA", "Comp_Regulatory",
        "Comp_Documentation", "Comp_IncidentReport", "Comp_MedAdmin",

        // Professional
        "Prof_Boundaries", "Prof_FamilyComm", "Prof_CulturalDEI",
        "Prof_Teamwork", "Prof_CompassionFatigue", "Prof_Safety",
        "Prof_Technology", "Prof_TimeMgmt", "Prof_EscalatedFamily",
        "Prof_ConflictRes", "Prof_BrainScience"
    }),

    Unpivoted = Table.UnpivotOtherColumns(
        KeepColumns,
        {"ResponseID", "Role", "RoleLabel", "Site", "SiteLabel",
         "TenureTCG", "TenureField", "YearsCurrentRole", "EducationLevel", "Supervisory"},
        "TopicCode", "Score"
    ),

    TypedScore = Table.TransformColumnTypes(Unpivoted, {{"Score", Int64.Type}}),

    AddSection = Table.AddColumn(TypedScore, "Section", each
        if Text.StartsWith([TopicCode], "Beh_") then "Behavioral Support"
        else if Text.StartsWith([TopicCode], "Cls_") then "Classroom & Instruction"
        else if Text.StartsWith([TopicCode], "IEP_") then "Related Services & IEP"
        else if Text.StartsWith([TopicCode], "Comp_") then "Compliance"
        else if Text.StartsWith([TopicCode], "Prof_") then "Professional Skills"
        else "Other",
        type text
    ),

    AddTopicLabel = Table.AddColumn(AddSection, "TopicLabel", each
        // Behavioral
        if [TopicCode] = "Beh_FBA" then "FBA"
        else if [TopicCode] = "Beh_BIP" then "BIP"
        else if [TopicCode] = "Beh_DeEsc" then "De-escalation"
        else if [TopicCode] = "Beh_PCM" then "PCM"
        else if [TopicCode] = "Beh_TIC" then "Trauma-Informed Care"
        else if [TopicCode] = "Beh_PBIS" then "PBIS"
        else if [TopicCode] = "Beh_Restorative" then "Restorative Practices"
        else if [TopicCode] = "Beh_DataCollection" then "Behavioral Data Collection"
        else if [TopicCode] = "Beh_TBAStrategies" then "TBA Strategies"
        else if [TopicCode] = "Beh_Transitions" then "Transitions"
        else if [TopicCode] = "Beh_AntiBullying" then "Anti-Bullying"
        else if [TopicCode] = "Beh_SuicideRisk" then "Suicide Risk"
        else if [TopicCode] = "Beh_Elopement" then "Elopement"
        else if [TopicCode] = "Beh_MedEmergency" then "Medical Emergency"
        // Classroom
        else if [TopicCode] = "Cls_Differentiation" then "Differentiation"
        else if [TopicCode] = "Cls_Environment" then "Classroom Environment"
        else if [TopicCode] = "Cls_AccommodMod" then "Accommodations/Modifications"
        else if [TopicCode] = "Cls_SEL" then "SEL"
        else if [TopicCode] = "Cls_AssistTech" then "Assistive Technology"
        else if [TopicCode] = "Cls_ProgressMon" then "Progress Monitoring"
        else if [TopicCode] = "Cls_CoTeach" then "Co-Teaching"
        else if [TopicCode] = "Cls_PBL" then "Project-Based Learning"
        else if [TopicCode] = "Cls_Sensory" then "Sensory Processing"
        // IEP
        else if [TopicCode] = "IEP_GoalWriting" then "IEP Goal Writing"
        else if [TopicCode] = "IEP_TeacherCollab" then "IEP Teacher Collaboration"
        else if [TopicCode] = "IEP_Caseload" then "Caseload Management"
        else if [TopicCode] = "IEP_ServiceModels" then "Service Delivery Models"
        else if [TopicCode] = "IEP_ProgressMon" then "IEP Progress Monitoring"
        else if [TopicCode] = "IEP_FamilyCoord" then "IEP Family Coordination"
        else if [TopicCode] = "IEP_Timelines" then "IEP Timelines"
        else if [TopicCode] = "IEP_Classifications" then "IEP Classifications & Diagnoses"
        else if [TopicCode] = "IEP_ReadIEP" then "Reading a Complete IEP"
        else if [TopicCode] = "IEP_EvidenceBased" then "Evidence-Based Interventions"
        else if [TopicCode] = "IEP_Transition" then "Transition Planning"
        // Compliance
        else if [TopicCode] = "Comp_MandatedReporter" then "Mandated Reporting"
        else if [TopicCode] = "Comp_FERPA" then "FERPA"
        else if [TopicCode] = "Comp_Restraint" then "Restraint"
        else if [TopicCode] = "Comp_SPEDLaw" then "SPED Law"
        else if [TopicCode] = "Comp_HIPAA" then "HIPAA"
        else if [TopicCode] = "Comp_Regulatory" then "COMAR / MSDE & OSSE / DCPS Regulations"
        else if [TopicCode] = "Comp_Documentation" then "Documentation & Record Keeping"
        else if [TopicCode] = "Comp_IncidentReport" then "Incident Reporting"
        else if [TopicCode] = "Comp_MedAdmin" then "Medication Administration"
        // Professional
        else if [TopicCode] = "Prof_Boundaries" then "Professional Boundaries"
        else if [TopicCode] = "Prof_FamilyComm" then "Family Communication"
        else if [TopicCode] = "Prof_CulturalDEI" then "Cultural Humility/DEI"
        else if [TopicCode] = "Prof_Teamwork" then "Teamwork"
        else if [TopicCode] = "Prof_CompassionFatigue" then "Self-Care & Wellness"
        else if [TopicCode] = "Prof_Safety" then "Safety/Emergency Prep"
        else if [TopicCode] = "Prof_Technology" then "Technology Tools"
        else if [TopicCode] = "Prof_TimeMgmt" then "Time Management"
        else if [TopicCode] = "Prof_EscalatedFamily" then "Escalated Family Interactions"
        else if [TopicCode] = "Prof_ConflictRes" then "Conflict Resolution"
        else if [TopicCode] = "Prof_BrainScience" then "Brain Science & Behavior"
        else [TopicCode],
        type text
    ),

    ExcludeNA = Table.SelectRows(AddTopicLabel, each [Score] <> 0 and [Score] <> null)

in
    ExcludeNA
