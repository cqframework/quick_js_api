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
An occurrence of a proposal for an encounter to take place between a patient and a provider, e.g., a proposed referral, a proposed hospitalization.

<b>Example</b>
<u>Expression from source knowledge artifact</u>
Refer patient for a consult to nutrition services for weight loss

<u>Expression in CQL+QUICK</u>
let NutrRef =
  [Encounter, Proposal] E
    where
     serviceType in "Consult"
       and 
     indication[1].reason in "Weight Loss"
 
# =require Period.js.coffee
# =require StatementOfOccurrence.js.coffee
# =require Quantity.js.coffee
# =require StatementTopic.js.coffee
# =require EncounterCondition.js.coffee
# =require Organization.js.coffee
# =require Location.js.coffee
# =require Indication.js.coffee
# =require ActionStatus.js.coffee
# =require Schedule.js.coffee
# =require Hospitalization.js.coffee
# =require StatementModality.js.coffee
# =require Patient.js.coffee
# =require CodeableConcept.js.coffee
# =require Identifier.js.coffee
# =require Person.js.coffee
# =require Entity.js.coffee
@class EncounterProposalOccurrence
@exports  EncounterProposalOccurrence as quick.EncounterProposalOccurrence
###
class QUICK.EncounterProposalOccurrence
  constructor: (@json) ->
    super()
   
###*
Details about the clinical statement that were not represented at all or sufficiently in one of the attributes provided in a class. These may include for example a comment, an instruction, or a note associated with the statement.
### 
  additionalText: ->  @json['additionalText'] 
 
 
###*
Classification of the encounter. For example, inpatient, outpatient, virtual.

(see http://hl7.org/fhir/encounter-class for values)
### 
  class: ->  @json['class'] 
 
 
###*
The status of an action. It is expected that the range of values for statusCode (i.e., the value set) will vary by the subtypes of Action. For example, Proposal might have one of its status value as Declined.
### 
  currentStatus: -> 
    for x in @json['currentStatus'] 
      new ActionStatus(x)
     
   
###*
The encounter within which the clinical statement was created.
### 
  encounter: -> 
    for x in @json['encounter'] 
      new StatementOfOccurrence(x)
     
   
###*
If the encounter is repeated, the frequency pattern for repetitions.
### 
  encounterSchedule: -> 
    for x in @json['encounterSchedule'] 
      new Schedule(x)
     
   
###*
The time when the action is expected to be performed.
### 
  expectedPerformanceTime: -> 
    for x in @json['expectedPerformanceTime'] 
      new Period(x)
     
   
###*
Details about an admission to a clinic
### 
  hospitalization: -> 
    for x in @json['hospitalization'] 
      new Hospitalization(x)
     
   
###*
<font color="#0f0f0f">A unique ID of this clinical statement for reference purposes. It must be provided if user wants it returned as part of any output, otherwise it will be auto-generated, if needed, by CDS system. Does not need to be the actual ID of the source system. </font>
### 
  identifier: -> 
    for x in @json['identifier'] 
      new Identifier(x)
     
   
###*
Reason or justification for the action. Reasons may also be specified for not performing an action. 
### 
  indication: -> 
    for x in @json['indication'] 
      new Indication(x)
     
   
###*
Quantity of time the encounter lasted.
### 
  length: -> 
    for x in @json['length'] 
      new Quantity(x)
     
   
###*
The location the encounter takes place, e.g., clinic location, hospital bed
### 
  location: -> 
    for x in @json['location'] 
      new Location(x)
     
   
###*
The modality of a Clinical Statement describes the way the topic exists, happens, or is experienced.
### 
  modality: -> new StatementModality( @json['modality'] )
 
 
###*
The mode by which the proposal was received (such as by telephone, electronic, verbal, written). This describes 'how' the communication was done as opposed to dataSourceType which specifies the 'where' and 'from'.
### 
  originationMode: -> 
    for x in @json['originationMode'] 
      new CodeableConcept(x)
     
   
###*
Another Encounter of which this encounter is a part of (administratively or in time).
### 
  partOf: -> 
    for x in @json['partOf'] 
      new StatementOfOccurrence(x)
     
   
###*
Preferences are choices made by patients about options for care or treatment (including scheduling, care experience, and meeting of personal health goals) and the sharing and disclosure of their health information.
### 
  patientPreference: -> 
    for x in @json['patientPreference'] 
      new CodeableConcept(x)
     
   
###*
The specific condition under which the act being proposed is performed. For example, Pain, Shortness of Breath, Insomnia, Nausea.

If this attribute is specified, it implies that the act must be performed as needed (i.e., is prn).

Reasons such as "SpO2 less than x%" should be addressed as a PRN Instruction rather than a PRN Reason as it is unlikely that a value set can be identified for such range of possible observations.
### 
  prnReason: -> 
    for x in @json['prnReason'] 
      new Indication(x)
     
   
###*
The identifier of a set of constraints placed on a clinical statement.  If there are multiple templates specified for the element, then the element must satisfy ALL constraints defined in ANY template at that level.
### 
  profileId: -> 
    for x in @json['profileId'] 
      new Identifier(x)
     
   
###*
The time when the proposal was made.
### 
  proposedAtTime: ->  @json['proposedAtTime'] 
 
 
###*
Provider preferences are choices made by care providers relative to options for care or treatment (including scheduling, care experience, and meeting of personal health goals).
### 
  providerPreference: -> 
    for x in @json['providerPreference'] 
      new CodeableConcept(x)
     
   
###*
The conditions considered and cared for within this encounter. This includes items such as reason for visit, admission diagnosis, discharge diagnosis, chief complaint. Do not use reason or indication in the Action class to specify encounter related diagnoses.
### 
  relatedCondition: -> 
    for x in @json['relatedCondition'] 
      new EncounterCondition(x)
     
   
###*
Department or team providing care.
### 
  serviceProvider: -> 
    for x in @json['serviceProvider'] 
      new Organization(x)
     
   
###*
The type of service provided during the encounter. For example, surgery, rehabilitation, annual physical exam.

Value Set http://hl7.org/fhir/vs/encounter-type
### 
  serviceType: -> 
    for x in @json['serviceType'] 
      new CodeableConcept(x)
     
   
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
The past statuses of this action, e.g., an order may evolve from draft to placed to in progress to completed or canceled.
### 
  statusHistory: -> 
    for x in @json['statusHistory'] 
      new ActionStatus(x)
     
   
###*
The patient described by this statement.
### 
  subject: -> new Patient( @json['subject'] )
 
 
###*
The subject matter of this clinical statement. The topic may be an action like medication administration, or a finding or other observations about the patient.
### 
  topic: -> new StatementTopic( @json['topic'] )
 
 
###*
Characterizes how quickly the proposed act must be initiated. Includes concepts such as stat, urgent, routine.
### 
  urgency: -> 
    for x in @json['urgency'] 
      new CodeableConcept(x)
     
   
