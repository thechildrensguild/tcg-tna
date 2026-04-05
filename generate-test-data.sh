#!/bin/bash
# Generate 12 test responses to TNA survey via Power Automate HTTP trigger
# DELETE THESE FROM THE LIST BEFORE GOING LIVE

ENDPOINT='https://defaulta074af5d321f4e67a992697496183a.46.environment.api.powerplatform.com:443/powerautomate/automations/direct/workflows/f53e206cf0e14352ba944e54e699a603/triggers/When_a_HTTP_request_is_received/paths/invoke?api-version=1&sp=%2Ftriggers%2FWhen_a_HTTP_request_is_received%2Frun&sv=1.0&sig=-PH-WiTbhYWdyfDOJ3N6TiyNoXGk3njC4ZsR3E6wICM'

submit() {
  echo "Submitting: $1 at $2..."
  curl -s -o /dev/null -w "%{http_code}" -X POST "$ENDPOINT" \
    -H "Content-Type: application/json" \
    -d "$3"
  echo ""
}

# 1. SPED Teacher at TCG DC — strong behavioral, weak tech
submit "SPED Teacher" "TCGDC" '{
  "Role":"SPED_TEACHER","Site":"TCGDC","TenureTCG":"3_5","TenureField":"6_10",
  "AgeGroups":"6-12","Credentials":"SPED Certification",
  "Beh_FBA":4,"Beh_BIP":4,"Beh_DeEsc":5,"Beh_PCM":4,"Beh_TIC":5,
  "Beh_PBIS":4,"Beh_Restorative":3,"Beh_DataCollection":4,
  "Beh_TBAStrategies":3,"Beh_Transitions":4,"Beh_AntiBullying":3,
  "Beh_SuicideRisk":2,"Beh_Elopement":4,"Beh_MedEmergency":2,
  "Cls_Differentiation":4,"Cls_Environment":5,"Cls_AccommodMod":4,"Cls_SEL":3,
  "Cls_AssistTech":2,"Cls_ProgressMon":4,"Cls_CoTeach":3,"Cls_PBL":2,
  "IEP_GoalWriting":5,"IEP_TeacherCollab":4,"IEP_Caseload":3,
  "IEP_ServiceModels":3,"IEP_ProgressMon":4,"IEP_FamilyCoord":3,"IEP_Timelines":4,
  "Comp_MandatedReporter":5,"Comp_FERPA":4,"Comp_Restraint":4,
  "Comp_SPEDLaw":3,"Comp_CARF":2,"Comp_IncidentReport":4,"Comp_MedAdmin":2,
  "Prof_Boundaries":4,"Prof_FamilyComm":3,"Prof_CulturalDEI":3,
  "Prof_Teamwork":4,"Prof_CompassionFatigue":2,"Prof_Safety":3,
  "Prof_Technology":2,"Prof_TimeMgmt":3,"Prof_EscalatedFamily":2,
  "Satisfaction":4,
  "Priority1":"BEH_SUICIDE","Priority2":"PROF_FATIGUE","Priority3":"CLS_TECH",
  "OpenTopic":"","Onboarding_GapTopics":"","PreferredFormat":"In-person workshop",
  "OpenComments":"Would love more training on crisis intervention."
}'

# 2. TBA at TCG PG — low behavioral confidence
submit "TBA" "TCGPG" '{
  "Role":"TBA","Site":"TCGPG","TenureTCG":"0_1","TenureField":"0_2",
  "AgeGroups":"13-18","Credentials":"",
  "Beh_FBA":1,"Beh_BIP":1,"Beh_DeEsc":2,"Beh_PCM":2,"Beh_TIC":2,
  "Beh_PBIS":2,"Beh_Restorative":1,"Beh_DataCollection":1,
  "Beh_TBAStrategies":3,"Beh_Transitions":2,"Beh_AntiBullying":2,
  "Beh_SuicideRisk":1,"Beh_Elopement":2,"Beh_MedEmergency":1,
  "Cls_Differentiation":2,"Cls_Environment":3,"Cls_AccommodMod":1,"Cls_SEL":2,
  "Cls_AssistTech":1,"Cls_ProgressMon":2,"Cls_CoTeach":0,"Cls_PBL":1,
  "IEP_GoalWriting":0,"IEP_TeacherCollab":2,"IEP_Caseload":0,
  "IEP_ServiceModels":0,"IEP_ProgressMon":0,"IEP_FamilyCoord":1,"IEP_Timelines":0,
  "Comp_MandatedReporter":3,"Comp_FERPA":2,"Comp_Restraint":2,
  "Comp_SPEDLaw":1,"Comp_CARF":1,"Comp_IncidentReport":2,"Comp_MedAdmin":1,
  "Prof_Boundaries":3,"Prof_FamilyComm":2,"Prof_CulturalDEI":2,
  "Prof_Teamwork":3,"Prof_CompassionFatigue":1,"Prof_Safety":2,
  "Prof_Technology":2,"Prof_TimeMgmt":2,"Prof_EscalatedFamily":1,
  "Satisfaction":3,
  "Priority1":"BEH_DEESC","Priority2":"BEH_FBA","Priority3":"COMP_RESTRAINT",
  "OpenTopic":"How to handle aggressive behaviors safely",
  "Onboarding_GapTopics":"PCM training was rushed","PreferredFormat":"Hands-on practice",
  "OpenComments":"I feel unprepared for crisis situations as a new TBA."
}'

# 3. Gen Ed Teacher at MAA — strong classroom, weak IEP
submit "Gen Ed Teacher" "MAA" '{
  "Role":"GEN_ED_TEACHER","Site":"MAA","TenureTCG":"1_3","TenureField":"3_5",
  "AgeGroups":"6-12","Credentials":"Teaching Certificate",
  "Beh_FBA":2,"Beh_BIP":2,"Beh_DeEsc":3,"Beh_PCM":3,"Beh_TIC":3,
  "Beh_PBIS":3,"Beh_Restorative":3,"Beh_DataCollection":2,
  "Beh_TBAStrategies":2,"Beh_Transitions":3,"Beh_AntiBullying":3,
  "Beh_SuicideRisk":2,"Beh_Elopement":2,"Beh_MedEmergency":2,
  "Cls_Differentiation":4,"Cls_Environment":4,"Cls_AccommodMod":3,"Cls_SEL":4,
  "Cls_AssistTech":3,"Cls_ProgressMon":4,"Cls_CoTeach":4,"Cls_PBL":4,
  "IEP_GoalWriting":1,"IEP_TeacherCollab":2,"IEP_Caseload":0,
  "IEP_ServiceModels":1,"IEP_ProgressMon":2,"IEP_FamilyCoord":2,"IEP_Timelines":1,
  "Comp_MandatedReporter":4,"Comp_FERPA":3,"Comp_Restraint":2,
  "Comp_SPEDLaw":2,"Comp_CARF":1,"Comp_IncidentReport":3,"Comp_MedAdmin":1,
  "Prof_Boundaries":4,"Prof_FamilyComm":4,"Prof_CulturalDEI":3,
  "Prof_Teamwork":4,"Prof_CompassionFatigue":3,"Prof_Safety":3,
  "Prof_Technology":3,"Prof_TimeMgmt":4,"Prof_EscalatedFamily":2,
  "Satisfaction":4,
  "Priority1":"IEP_GOALS","Priority2":"BEH_FBA","Priority3":"COMP_SPED_LAW",
  "OpenTopic":"","Onboarding_GapTopics":"","PreferredFormat":"Online self-paced",
  "OpenComments":"Need more support understanding IEP requirements as a gen ed teacher."
}'

# 4. Social Worker at TCG Baltimore — strong compliance, weak tech
submit "Social Worker" "TCG_BALT" '{
  "Role":"SOCIAL_WORKER","Site":"TCG_BALT","TenureTCG":"6_10","TenureField":"10_PLUS",
  "AgeGroups":"6-12,13-18","Credentials":"LCSW",
  "Beh_FBA":3,"Beh_BIP":3,"Beh_DeEsc":5,"Beh_PCM":4,"Beh_TIC":5,
  "Beh_PBIS":3,"Beh_Restorative":4,"Beh_DataCollection":3,
  "Beh_TBAStrategies":2,"Beh_Transitions":3,"Beh_AntiBullying":4,
  "Beh_SuicideRisk":5,"Beh_Elopement":3,"Beh_MedEmergency":3,
  "Cls_Differentiation":0,"Cls_Environment":0,"Cls_AccommodMod":0,"Cls_SEL":5,
  "Cls_AssistTech":0,"Cls_ProgressMon":0,"Cls_CoTeach":0,"Cls_PBL":0,
  "IEP_GoalWriting":3,"IEP_TeacherCollab":4,"IEP_Caseload":4,
  "IEP_ServiceModels":3,"IEP_ProgressMon":3,"IEP_FamilyCoord":5,"IEP_Timelines":4,
  "Comp_MandatedReporter":5,"Comp_FERPA":5,"Comp_Restraint":4,
  "Comp_SPEDLaw":4,"Comp_CARF":3,"Comp_IncidentReport":5,"Comp_MedAdmin":2,
  "Prof_Boundaries":5,"Prof_FamilyComm":5,"Prof_CulturalDEI":4,
  "Prof_Teamwork":4,"Prof_CompassionFatigue":3,"Prof_Safety":4,
  "Prof_Technology":2,"Prof_TimeMgmt":3,"Prof_EscalatedFamily":4,
  "Satisfaction":5,
  "Priority1":"PROF_FATIGUE","Priority2":"PROF_TECH","Priority3":"COMP_CARF",
  "OpenTopic":"","Onboarding_GapTopics":"","PreferredFormat":"In-person workshop",
  "OpenComments":"Compassion fatigue is a real issue across our team."
}'

# 5. Teacher Assistant at MAGB — new, low confidence across board
submit "Teacher Asst" "MAGB" '{
  "Role":"TEACHER_ASST","Site":"MAGB","TenureTCG":"0_1","TenureField":"0_2",
  "AgeGroups":"6-12","Credentials":"",
  "Beh_FBA":1,"Beh_BIP":1,"Beh_DeEsc":2,"Beh_PCM":1,"Beh_TIC":2,
  "Beh_PBIS":2,"Beh_Restorative":1,"Beh_DataCollection":1,
  "Beh_TBAStrategies":1,"Beh_Transitions":2,"Beh_AntiBullying":2,
  "Beh_SuicideRisk":1,"Beh_Elopement":1,"Beh_MedEmergency":1,
  "Cls_Differentiation":2,"Cls_Environment":2,"Cls_AccommodMod":1,"Cls_SEL":2,
  "Cls_AssistTech":1,"Cls_ProgressMon":1,"Cls_CoTeach":2,"Cls_PBL":1,
  "IEP_GoalWriting":0,"IEP_TeacherCollab":1,"IEP_Caseload":0,
  "IEP_ServiceModels":0,"IEP_ProgressMon":0,"IEP_FamilyCoord":1,"IEP_Timelines":0,
  "Comp_MandatedReporter":2,"Comp_FERPA":1,"Comp_Restraint":1,
  "Comp_SPEDLaw":1,"Comp_CARF":1,"Comp_IncidentReport":2,"Comp_MedAdmin":1,
  "Prof_Boundaries":2,"Prof_FamilyComm":1,"Prof_CulturalDEI":2,
  "Prof_Teamwork":3,"Prof_CompassionFatigue":1,"Prof_Safety":2,
  "Prof_Technology":2,"Prof_TimeMgmt":2,"Prof_EscalatedFamily":1,
  "Satisfaction":3,
  "Priority1":"BEH_DEESC","Priority2":"BEH_PCM","Priority3":"COMP_MANDATE",
  "OpenTopic":"Everything is new to me","Onboarding_GapTopics":"Needed more orientation time",
  "PreferredFormat":"Hands-on practice",
  "OpenComments":"I started two weeks ago and feel overwhelmed."
}'

# 6. School Admin at MPCP — high confidence, priorities are systemic
submit "School Admin" "MPCP" '{
  "Role":"SCHOOL_ADMIN","Site":"MPCP","TenureTCG":"6_10","TenureField":"10_PLUS",
  "AgeGroups":"6-12,13-18","Credentials":"Admin Certification",
  "Beh_FBA":4,"Beh_BIP":4,"Beh_DeEsc":5,"Beh_PCM":4,"Beh_TIC":5,
  "Beh_PBIS":5,"Beh_Restorative":4,"Beh_DataCollection":4,
  "Beh_TBAStrategies":3,"Beh_Transitions":4,"Beh_AntiBullying":4,
  "Beh_SuicideRisk":4,"Beh_Elopement":4,"Beh_MedEmergency":3,
  "Cls_Differentiation":4,"Cls_Environment":5,"Cls_AccommodMod":4,"Cls_SEL":4,
  "Cls_AssistTech":3,"Cls_ProgressMon":4,"Cls_CoTeach":4,"Cls_PBL":3,
  "IEP_GoalWriting":4,"IEP_TeacherCollab":5,"IEP_Caseload":4,
  "IEP_ServiceModels":4,"IEP_ProgressMon":4,"IEP_FamilyCoord":4,"IEP_Timelines":5,
  "Comp_MandatedReporter":5,"Comp_FERPA":5,"Comp_Restraint":5,
  "Comp_SPEDLaw":4,"Comp_CARF":4,"Comp_IncidentReport":5,"Comp_MedAdmin":3,
  "Prof_Boundaries":5,"Prof_FamilyComm":5,"Prof_CulturalDEI":4,
  "Prof_Teamwork":5,"Prof_CompassionFatigue":3,"Prof_Safety":5,
  "Prof_Technology":4,"Prof_TimeMgmt":4,"Prof_EscalatedFamily":4,
  "Satisfaction":5,
  "Priority1":"PROF_FATIGUE","Priority2":"PROF_DEI","Priority3":"BEH_TBA",
  "OpenTopic":"","Onboarding_GapTopics":"","PreferredFormat":"In-person workshop",
  "OpenComments":"Staff burnout is my biggest concern right now."
}'

# 7. SLP at MGA Laurel — strong IEP, mixed behavioral
submit "SLP" "MGA_LAUREL" '{
  "Role":"SLP","Site":"MGA_LAUREL","TenureTCG":"3_5","TenureField":"6_10",
  "AgeGroups":"3-5,6-12","Credentials":"CCC-SLP",
  "Beh_FBA":2,"Beh_BIP":2,"Beh_DeEsc":3,"Beh_PCM":2,"Beh_TIC":3,
  "Beh_PBIS":3,"Beh_Restorative":2,"Beh_DataCollection":3,
  "Beh_TBAStrategies":1,"Beh_Transitions":3,"Beh_AntiBullying":2,
  "Beh_SuicideRisk":2,"Beh_Elopement":2,"Beh_MedEmergency":2,
  "Cls_Differentiation":3,"Cls_Environment":3,"Cls_AccommodMod":4,"Cls_SEL":3,
  "Cls_AssistTech":4,"Cls_ProgressMon":4,"Cls_CoTeach":3,"Cls_PBL":2,
  "IEP_GoalWriting":5,"IEP_TeacherCollab":4,"IEP_Caseload":4,
  "IEP_ServiceModels":5,"IEP_ProgressMon":5,"IEP_FamilyCoord":4,"IEP_Timelines":5,
  "Comp_MandatedReporter":4,"Comp_FERPA":4,"Comp_Restraint":2,
  "Comp_SPEDLaw":4,"Comp_CARF":3,"Comp_IncidentReport":3,"Comp_MedAdmin":1,
  "Prof_Boundaries":4,"Prof_FamilyComm":4,"Prof_CulturalDEI":3,
  "Prof_Teamwork":4,"Prof_CompassionFatigue":3,"Prof_Safety":3,
  "Prof_Technology":3,"Prof_TimeMgmt":4,"Prof_EscalatedFamily":3,
  "Satisfaction":4,
  "Priority1":"BEH_TBA","Priority2":"COMP_RESTRAINT","Priority3":"PROF_ESCALATED",
  "OpenTopic":"","Onboarding_GapTopics":"","PreferredFormat":"Online self-paced",
  "OpenComments":"Would benefit from cross-training with TBAs on behavioral strategies."
}'

# 8. OT at TCG DC — strong IEP, low behavioral
submit "OT" "TCGDC" '{
  "Role":"OT","Site":"TCGDC","TenureTCG":"1_3","TenureField":"3_5",
  "AgeGroups":"3-5,6-12","Credentials":"OTR/L",
  "Beh_FBA":2,"Beh_BIP":1,"Beh_DeEsc":3,"Beh_PCM":2,"Beh_TIC":3,
  "Beh_PBIS":2,"Beh_Restorative":2,"Beh_DataCollection":3,
  "Beh_TBAStrategies":1,"Beh_Transitions":3,"Beh_AntiBullying":2,
  "Beh_SuicideRisk":1,"Beh_Elopement":2,"Beh_MedEmergency":2,
  "Cls_Differentiation":3,"Cls_Environment":4,"Cls_AccommodMod":5,"Cls_SEL":3,
  "Cls_AssistTech":5,"Cls_ProgressMon":4,"Cls_CoTeach":3,"Cls_PBL":2,
  "IEP_GoalWriting":5,"IEP_TeacherCollab":4,"IEP_Caseload":4,
  "IEP_ServiceModels":4,"IEP_ProgressMon":5,"IEP_FamilyCoord":4,"IEP_Timelines":4,
  "Comp_MandatedReporter":4,"Comp_FERPA":3,"Comp_Restraint":2,
  "Comp_SPEDLaw":3,"Comp_CARF":2,"Comp_IncidentReport":3,"Comp_MedAdmin":2,
  "Prof_Boundaries":4,"Prof_FamilyComm":4,"Prof_CulturalDEI":3,
  "Prof_Teamwork":4,"Prof_CompassionFatigue":2,"Prof_Safety":3,
  "Prof_Technology":3,"Prof_TimeMgmt":3,"Prof_EscalatedFamily":2,
  "Satisfaction":4,
  "Priority1":"BEH_SUICIDE","Priority2":"BEH_DEESC","Priority3":"PROF_FATIGUE",
  "OpenTopic":"Sensory strategies for de-escalation","Onboarding_GapTopics":"",
  "PreferredFormat":"In-person workshop",
  "OpenComments":""
}'

# 9. SPED Teacher at TCG PG — mid-career, moderate scores
submit "SPED Teacher" "TCGPG" '{
  "Role":"SPED_TEACHER","Site":"TCGPG","TenureTCG":"3_5","TenureField":"6_10",
  "AgeGroups":"13-18","Credentials":"SPED Certification",
  "Beh_FBA":3,"Beh_BIP":3,"Beh_DeEsc":4,"Beh_PCM":3,"Beh_TIC":4,
  "Beh_PBIS":3,"Beh_Restorative":3,"Beh_DataCollection":3,
  "Beh_TBAStrategies":3,"Beh_Transitions":3,"Beh_AntiBullying":3,
  "Beh_SuicideRisk":2,"Beh_Elopement":3,"Beh_MedEmergency":2,
  "Cls_Differentiation":4,"Cls_Environment":4,"Cls_AccommodMod":4,"Cls_SEL":3,
  "Cls_AssistTech":2,"Cls_ProgressMon":3,"Cls_CoTeach":3,"Cls_PBL":2,
  "IEP_GoalWriting":4,"IEP_TeacherCollab":3,"IEP_Caseload":3,
  "IEP_ServiceModels":3,"IEP_ProgressMon":4,"IEP_FamilyCoord":3,"IEP_Timelines":4,
  "Comp_MandatedReporter":4,"Comp_FERPA":3,"Comp_Restraint":3,
  "Comp_SPEDLaw":3,"Comp_CARF":2,"Comp_IncidentReport":4,"Comp_MedAdmin":2,
  "Prof_Boundaries":4,"Prof_FamilyComm":3,"Prof_CulturalDEI":3,
  "Prof_Teamwork":3,"Prof_CompassionFatigue":2,"Prof_Safety":3,
  "Prof_Technology":3,"Prof_TimeMgmt":3,"Prof_EscalatedFamily":2,
  "Satisfaction":3,
  "Priority1":"BEH_SUICIDE","Priority2":"COMP_CARF","Priority3":"PROF_TECH",
  "OpenTopic":"","Onboarding_GapTopics":"","PreferredFormat":"Blended",
  "OpenComments":"CARF prep is stressful and I never feel ready."
}'

# 10. School Counselor at TCG Baltimore — strong professional, weak compliance
submit "School Counselor" "TCG_BALT" '{
  "Role":"SCHOOL_COUNSELOR","Site":"TCG_BALT","TenureTCG":"1_3","TenureField":"3_5",
  "AgeGroups":"6-12,13-18","Credentials":"School Counseling License",
  "Beh_FBA":2,"Beh_BIP":2,"Beh_DeEsc":4,"Beh_PCM":3,"Beh_TIC":5,
  "Beh_PBIS":3,"Beh_Restorative":4,"Beh_DataCollection":2,
  "Beh_TBAStrategies":2,"Beh_Transitions":3,"Beh_AntiBullying":4,
  "Beh_SuicideRisk":4,"Beh_Elopement":2,"Beh_MedEmergency":2,
  "Cls_Differentiation":0,"Cls_Environment":0,"Cls_AccommodMod":0,"Cls_SEL":5,
  "Cls_AssistTech":0,"Cls_ProgressMon":0,"Cls_CoTeach":0,"Cls_PBL":0,
  "IEP_GoalWriting":2,"IEP_TeacherCollab":3,"IEP_Caseload":3,
  "IEP_ServiceModels":2,"IEP_ProgressMon":2,"IEP_FamilyCoord":4,"IEP_Timelines":2,
  "Comp_MandatedReporter":4,"Comp_FERPA":3,"Comp_Restraint":2,
  "Comp_SPEDLaw":2,"Comp_CARF":1,"Comp_IncidentReport":3,"Comp_MedAdmin":1,
  "Prof_Boundaries":5,"Prof_FamilyComm":5,"Prof_CulturalDEI":4,
  "Prof_Teamwork":5,"Prof_CompassionFatigue":3,"Prof_Safety":4,
  "Prof_Technology":3,"Prof_TimeMgmt":4,"Prof_EscalatedFamily":4,
  "Satisfaction":4,
  "Priority1":"COMP_CARF","Priority2":"BEH_FBA","Priority3":"PROF_FATIGUE",
  "OpenTopic":"","Onboarding_GapTopics":"","PreferredFormat":"In-person workshop",
  "OpenComments":"Would like a CARF overview specific to counseling documentation."
}'

# 11. TBA at TCG DC — experienced, moderate
submit "TBA" "TCGDC" '{
  "Role":"TBA","Site":"TCGDC","TenureTCG":"3_5","TenureField":"3_5",
  "AgeGroups":"6-12","Credentials":"",
  "Beh_FBA":3,"Beh_BIP":3,"Beh_DeEsc":4,"Beh_PCM":4,"Beh_TIC":4,
  "Beh_PBIS":3,"Beh_Restorative":3,"Beh_DataCollection":3,
  "Beh_TBAStrategies":4,"Beh_Transitions":4,"Beh_AntiBullying":3,
  "Beh_SuicideRisk":2,"Beh_Elopement":3,"Beh_MedEmergency":2,
  "Cls_Differentiation":3,"Cls_Environment":4,"Cls_AccommodMod":2,"Cls_SEL":3,
  "Cls_AssistTech":2,"Cls_ProgressMon":3,"Cls_CoTeach":0,"Cls_PBL":0,
  "IEP_GoalWriting":0,"IEP_TeacherCollab":2,"IEP_Caseload":0,
  "IEP_ServiceModels":0,"IEP_ProgressMon":0,"IEP_FamilyCoord":1,"IEP_Timelines":0,
  "Comp_MandatedReporter":4,"Comp_FERPA":3,"Comp_Restraint":4,
  "Comp_SPEDLaw":2,"Comp_CARF":2,"Comp_IncidentReport":4,"Comp_MedAdmin":2,
  "Prof_Boundaries":4,"Prof_FamilyComm":3,"Prof_CulturalDEI":3,
  "Prof_Teamwork":4,"Prof_CompassionFatigue":2,"Prof_Safety":4,
  "Prof_Technology":2,"Prof_TimeMgmt":3,"Prof_EscalatedFamily":3,
  "Satisfaction":4,
  "Priority1":"BEH_SUICIDE","Priority2":"BEH_MEDEMERG","Priority3":"PROF_FATIGUE",
  "OpenTopic":"","Onboarding_GapTopics":"","PreferredFormat":"Hands-on practice",
  "OpenComments":"Refresher on medical emergency response would be great."
}'

# 12. Support Staff at Multi-Site — low across the board
submit "Support Staff" "MULTI_SITE" '{
  "Role":"SUPPORT_STAFF","Site":"MULTI_SITE","TenureTCG":"0_1","TenureField":"0_2",
  "AgeGroups":"","Credentials":"",
  "Beh_FBA":0,"Beh_BIP":0,"Beh_DeEsc":2,"Beh_PCM":1,"Beh_TIC":2,
  "Beh_PBIS":1,"Beh_Restorative":1,"Beh_DataCollection":0,
  "Beh_TBAStrategies":0,"Beh_Transitions":1,"Beh_AntiBullying":2,
  "Beh_SuicideRisk":1,"Beh_Elopement":1,"Beh_MedEmergency":1,
  "Cls_Differentiation":0,"Cls_Environment":0,"Cls_AccommodMod":0,"Cls_SEL":1,
  "Cls_AssistTech":0,"Cls_ProgressMon":0,"Cls_CoTeach":0,"Cls_PBL":0,
  "IEP_GoalWriting":0,"IEP_TeacherCollab":0,"IEP_Caseload":0,
  "IEP_ServiceModels":0,"IEP_ProgressMon":0,"IEP_FamilyCoord":0,"IEP_Timelines":0,
  "Comp_MandatedReporter":2,"Comp_FERPA":1,"Comp_Restraint":1,
  "Comp_SPEDLaw":0,"Comp_CARF":0,"Comp_IncidentReport":2,"Comp_MedAdmin":0,
  "Prof_Boundaries":3,"Prof_FamilyComm":2,"Prof_CulturalDEI":2,
  "Prof_Teamwork":3,"Prof_CompassionFatigue":2,"Prof_Safety":2,
  "Prof_Technology":2,"Prof_TimeMgmt":3,"Prof_EscalatedFamily":1,
  "Satisfaction":3,
  "Priority1":"COMP_MANDATE","Priority2":"PROF_SAFETY","Priority3":"BEH_DEESC",
  "OpenTopic":"Basic safety procedures","Onboarding_GapTopics":"Never got a building tour",
  "PreferredFormat":"Online self-paced",
  "OpenComments":"I work in the office but want to understand what happens in classrooms."
}'

echo ""
echo "Done! 12 test responses submitted."
echo "Remember to delete these before going live."
