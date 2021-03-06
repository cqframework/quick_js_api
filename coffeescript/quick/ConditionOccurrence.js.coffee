# Copyright (c) 2014 The MITRE Corporation
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without modification, 
# are permitted provided that the following conditions are met:
# 
#     * Redistributions of source code must retain the above copyright notice, this 
#       list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright notice, 
#       this list of conditions and the following disclaimer in the documentation 
#       and/or other materials provided with the distribution.
#     * Neither the name of HL7 nor the names of its contributors may be used to 
#       endorse or promote products derived from this software without specific 
#       prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
# POSSIBILITY OF SUCH DAMAGE.
###*
@namespacing scoping into the QUICK namespace
###
this.QUICK ||= {}
###*
A statement about a condition that the patient has or is believed to have had.

<b>Example</b>
<u>Expression from source knowledge artifact</u>
Diagnosis, Active: Acute Myocardial Infarction" &lt;= 12 month(s) starts before start of "Measurement Period" using "Acute Myocardial Infarction Grouping Value Set 

<u>Expression in CQL+QUICK</u>
let AMICondition =
  [Condition: "Acute Myocardial Infarction Grouping ValueSet"] AMI
    where effectiveTime starts at most 12 months before start MeasurementPeriod
 
# =require Period.js.coffee
# =require Range.js.coffee
# =require StatementOfOccurrence.js.coffee
# =require BodySite.js.coffee
# =require StatementTopic.js.coffee
# =require Qualifier.js.coffee
# =require StatementModality.js.coffee
# =require Patient.js.coffee
# =require CodeableConcept.js.coffee
# =require Identifier.js.coffee
# =require Stage.js.coffee
# =require Person.js.coffee
# =require Entity.js.coffee
@class ConditionOccurrence
@exports  ConditionOccurrence as quick.ConditionOccurrence
###
class QUICK.ConditionOccurrence
  constructor: (@json) ->
    super()
   
###*
The subject's age when the problem abated.
### 
  abatementAge: -> 
    for x in @json['abatementAge'] 
      new Range(x)
     
   
###*
Details about the clinical statement that were not represented at all or sufficiently in one of the attributes provided in a class. These may include for example a comment, an instruction, or a note associated with the statement.
### 
  additionalText: ->  @json['additionalText'] 
 
 
###*
A category assigned to the condition. E.g. finding | diagnosis | concern | symptom.
### 
  category: -> 
    for x in @json['category'] 
      new CodeableConcept(x)
     
   
###*
The degree of confidence that this condition is correctly identifed
### 
  certainty: -> 
    for x in @json['certainty'] 
      new CodeableConcept(x)
     
   
###*
Identification of the condition, problem or diagnosis. e.g., diabetes mellitus type II, headache.
### 
  code: -> new CodeableConcept( @json['code'] )
 
 
###*
The qualifier allow specifying more details about the condition. e.g., severity, triggering factors, stage.

Qualifiers should not change the meaning of the condition other than making the condition more specific (i.e., they are not modifiers). 
### 
  conditionQualifier: -> 
    for x in @json['conditionQualifier'] 
      new Qualifier(x)
     
   
###*
Whether the problem was the cause or contributor to the subject's death.
### 
  contributionToDeath: -> 
    for x in @json['contributionToDeath'] 
      new CodeableConcept(x)
     
   
###*
Characterizes impact of condition on life, or durable impact on physiological function or on quality of life. Includes concepts such as life-threatening, or potential loss of function or capacity. E.g., Life threatening, potentially requires hospitalization, self-resolving. Different from severity in that a moderate subarachnoid hemorrhage is likely to be highly important, whereas a moderate headache is not as important.
### 
  criticality: -> 
    for x in @json['criticality'] 
      new CodeableConcept(x)
     
   
###*
The time period during which the condition is effective. The represents both the onset date and the date of abatement.
### 
  effectiveTime: -> 
    for x in @json['effectiveTime'] 
      new Period(x)
     
   
###*
The encounter within which the clinical statement was created.
### 
  encounter: -> 
    for x in @json['encounter'] 
      new StatementOfOccurrence(x)
     
   
###*
<font color="#0f0f0f">A unique ID of this clinical statement for reference purposes. It must be provided if user wants it returned as part of any output, otherwise it will be auto-generated, if needed, by CDS system. Does not need to be the actual ID of the source system. </font>
### 
  identifier: -> 
    for x in @json['identifier'] 
      new Identifier(x)
     
   
###*
Indicates the location of the condition on the subject's body.
### 
  location: -> 
    for x in @json['location'] 
      new BodySite(x)
     
   
###*
The modality of a Clinical Statement describes the way the topic exists, happens, or is experienced.
### 
  modality: -> new StatementModality( @json['modality'] )
 
 
###*
Time when the observation was made by the statement author. This may be different than the time the observation was physically recorded (which may occur much later). This also is different time than when the observed phenomenon actually occurred. For example, a patient had a headache three days ago, but reported it to their physician today. The physician would record the observedAtTime as today.
### 
  observedAtTime: -> 
    for x in @json['observedAtTime'] 
      new Period(x)
     
   
###*
The subject's age when the problem began.
### 
  onsetAge: -> 
    for x in @json['onsetAge'] 
      new Range(x)
     
   
###*
The identifier of a set of constraints placed on a clinical statement.  If there are multiple templates specified for the element, then the element must satisfy ALL constraints defined in ANY template at that level.
### 
  profileId: -> 
    for x in @json['profileId'] 
      new Identifier(x)
     
   
###*
A subjective assessment of the severity of the condition as evaluated by the clinician.
### 
  severity: -> 
    for x in @json['severity'] 
      new CodeableConcept(x)
     
   
###*
Clinical stage or grade of a condition. May include formal severity assessments.
### 
  stage: -> 
    for x in @json['stage'] 
      new Stage(x)
     
   
###*
The person who created the statement.

The source and the author of the statement may differ. Statement source is the system from which the statement originated. This may be an EHR or it may be a medical device. 

The statement author is the person creating the statement in the medical record. This may be a person who validates the data from a device, or obtains the history from a subject, a family member, or other source.
### 
  statementAuthor: -> 
    for x in @json['statementAuthor'] 
      new Person(x)
     
   
###*
The time at which the statement was made/recorded. This may not be the same time as the occurrence of the action or the observation event.
### 
  statementDateTime: ->  @json['statementDateTime'] 
 
 
###*
The person, device, or other system that was the source of this statement.
### 
  statementSource: -> 
    for x in @json['statementSource'] 
      new Entity(x)
     
   
###*
The state of the condition at the time of the observation, e.g., active, inactive.

(see http://hl7.org/fhir/condition-status for values)
### 
  status: ->  @json['status'] 
 
 
###*
The patient described by this statement.
### 
  subject: -> new Patient( @json['subject'] )
 
 
###*
The subject matter of this clinical statement. The topic may be an action like medication administration, or a finding or other observations about the patient.
### 
  topic: -> new StatementTopic( @json['topic'] )
 
 
