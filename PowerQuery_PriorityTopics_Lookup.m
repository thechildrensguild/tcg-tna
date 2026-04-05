let
    Source = Table.FromRows({
        // Behavioral Support
        {"BEH_FBA", "FBA", "Behavioral Support"},
        {"BEH_BIP", "BIP", "Behavioral Support"},
        {"BEH_DEESC", "De-escalation", "Behavioral Support"},
        {"BEH_PCM", "PCM", "Behavioral Support"},
        {"BEH_TIC", "Trauma-Informed Care", "Behavioral Support"},
        {"BEH_PBIS", "PBIS", "Behavioral Support"},
        {"BEH_RESTORATIVE", "Restorative Practices", "Behavioral Support"},
        {"BEH_DATA", "Behavioral Data Collection", "Behavioral Support"},
        {"BEH_TBA", "TBA Strategies", "Behavioral Support"},
        {"BEH_ANTIBULLY", "Anti-Bullying", "Behavioral Support"},
        {"BEH_SUICIDE", "Suicide Risk", "Behavioral Support"},
        {"BEH_ELOPEMENT", "Elopement", "Behavioral Support"},
        {"BEH_MEDEMERG", "Medical Emergency", "Behavioral Support"},

        // Classroom & Instruction
        {"CLS_DIFF", "Differentiation", "Classroom & Instruction"},
        {"CLS_ENV", "Classroom Environment", "Classroom & Instruction"},
        {"CLS_ACCOM", "Accommodations/Modifications", "Classroom & Instruction"},
        {"CLS_SEL", "SEL", "Classroom & Instruction"},
        {"CLS_TECH", "Assistive Technology", "Classroom & Instruction"},
        {"CLS_COTEACH", "Co-Teaching", "Classroom & Instruction"},
        {"CLS_PBL", "Project-Based Learning", "Classroom & Instruction"},
        {"CLS_SENSORY", "Sensory Processing", "Classroom & Instruction"},

        // Related Services & IEP
        {"IEP_GOALS", "IEP Goal Writing", "Related Services & IEP"},
        {"IEP_COLLAB", "IEP Teacher Collaboration", "Related Services & IEP"},
        {"IEP_CASELOAD", "Caseload Management", "Related Services & IEP"},
        {"IEP_SERVICE", "Service Delivery Models", "Related Services & IEP"},
        {"IEP_PROGRESS", "IEP Progress Monitoring", "Related Services & IEP"},
        {"IEP_FAMILY", "IEP Family Coordination", "Related Services & IEP"},
        {"IEP_COMPLIANCE", "IEP Timelines", "Related Services & IEP"},
        {"IEP_CLASSIFICATIONS", "IEP Classifications & Diagnoses", "Related Services & IEP"},
        {"IEP_READ_IEP", "Reading a Complete IEP", "Related Services & IEP"},
        {"IEP_EVIDENCE", "Evidence-Based Interventions", "Related Services & IEP"},
        {"IEP_TRANSITION", "Transition Planning", "Related Services & IEP"},

        // Compliance
        {"COMP_MANDATE", "Mandated Reporting", "Compliance"},
        {"COMP_FERPA", "FERPA", "Compliance"},
        {"COMP_RESTRAINT", "Restraint", "Compliance"},
        {"COMP_SPED_LAW", "SPED Law", "Compliance"},
        {"COMP_HIPAA", "HIPAA", "Compliance"},
        {"COMP_COMAR", "COMAR / MSDE Regulations", "Compliance"},
        {"COMP_OSSE", "OSSE / DCPS Regulations", "Compliance"},
        {"COMP_DOCUMENTATION", "Documentation & Record Keeping", "Compliance"},

        // Professional Skills
        {"PROF_BOUND", "Professional Boundaries", "Professional Skills"},
        {"PROF_FAMILY", "Family Communication", "Professional Skills"},
        {"PROF_DEI", "Cultural Humility/DEI", "Professional Skills"},
        {"PROF_FATIGUE", "Self-Care & Wellness", "Professional Skills"},
        {"PROF_SAFETY", "Safety/Emergency Prep", "Professional Skills"},
        {"PROF_TECH", "Technology Tools", "Professional Skills"},
        {"PROF_ESCALATED", "Escalated Family Interactions", "Professional Skills"},
        {"PROF_CONFLICT", "Conflict Resolution", "Professional Skills"},
        {"PROF_BRAIN", "Brain Science & Behavior", "Professional Skills"}
    },
    {"PriorityCode", "TopicLabel", "Section"}),

    Typed = Table.TransformColumnTypes(Source, {
        {"PriorityCode", type text},
        {"TopicLabel", type text},
        {"Section", type text}
    })

in
    Typed
