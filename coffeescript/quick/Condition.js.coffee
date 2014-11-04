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
Use to record detailed information about conditions, problems or diagnoses recognized by a clinician. There are many uses including: recording a Diagnosis during an Encounter; populating a problem List or a Summary Statement, such as a Discharge Summary.
 
# =require Period.js.coffee
# =require Range.js.coffee
# =require BodySite.js.coffee
# =require Qualifier.js.coffee
# =require CodeableConcept.js.coffee
# =require Stage.js.coffee
@class Condition
@exports  Condition as quick.Condition
###
class QUICK.Condition
  constructor: (@json) ->
    super()
   
###*
The subject's age when the problem abated.
### 
  abatementAge: -> 
    for x in @json['abatementAge'] 
      new Range(x)
     
   
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
Indicates the location of the condition on the subject's body.
### 
  location: -> 
    for x in @json['location'] 
      new BodySite(x)
     
   
###*
The subject's age when the problem began.
### 
  onsetAge: -> 
    for x in @json['onsetAge'] 
      new Range(x)
     
   
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
The state of the condition at the time of the observation, e.g., active, inactive.

(see http://hl7.org/fhir/condition-status for values)
### 
  status: ->  @json['status'] 
 
 
