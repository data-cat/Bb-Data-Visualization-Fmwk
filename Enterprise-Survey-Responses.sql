/*
Oracle. Returning Deployment, Survey Name, and User ID for Enterprise Surveys. Commented out are question/responses for survey.
*/

SELECT
  DEP.DEPLOYMENT_PK1
  ,SUR.Name
  ,USERS.USER_ID
--  ,QR.DEPLOYMENT_RESPONSE_PK1
--  ,Q.QTEXT_BODY
--  ,QR.CLP_SV_ANSWER_CHOICE_PK1
 -- ,AC.NAME AnswerChoice
--  ,QR.ANSWER_TEXT
FROM bblearn.CLP_SV_QUESTION_RESPONSE QR
INNER JOIN bblearn.CLP_SV_ANSWER_CHOICE AC 
ON QR.CLP_SV_ANSWER_CHOICE_PK1=AC.PK1
INNER JOIN bblearn.CLP_SV_SURVEY_DEPLOYMENT DEP 
ON QR.DEPLOYMENT_RESPONSE_PK1=DEP.DEPLOYMENT_PK1
INNER JOIN bblearn.CLP_SV_SURVEY SUR 
ON DEP.CLP_SV_SURVEY_PK1 = SUR.PK1
INNER JOIN bblearn.CLP_SV_QUESTION Q
ON SUR.PK1 = Q.CLP_SV_SURVEY_PK1
INNER JOIN bblearn.CLP_SV_QUESTION_RESPONSE QA
ON DEP.PK1 = QA.DEPLOYMENT_RESPONSE_PK1
INNER JOIN bblearn.CLP_SV_SURVEY_USER SU 
ON SUR.PK1 = SU.CLP_SV_SURVEY_PK1
INNER JOIN bblearn.USERS
ON SU.USER_PK1=USERS.PK1
ORDER BY DEPLOYMENT_PK1, NAME, USER_ID, Q.DISPLAY_ORDER
;