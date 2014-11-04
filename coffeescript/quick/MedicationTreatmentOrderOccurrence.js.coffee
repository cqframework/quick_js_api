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
An order for both supply of the medication and the instructions for administration of the medicine to a patient.

<b>Example</b>
<u>Expression from source knowledge artifact</u>
Ticagrelor, 180 mg loading dose by mouth once, 90 mg by mouth twice daily

<u>Expression in CQL+QUICK</u>
let TicagrelorOrder = 
  [MedicationTreatment, Order: "Ticagrelor"] T where
    exists (
      T.dosage LD where 
      IsEquivalent(LD.doseType, LoadingDoseCode)
        and
      LD.doseQuantity = 180 u 'mg'
        and
      IsEquivalent(LD.route, OralRouteCode)
        and
     ((LD.administrationFrequency.cycle.cycleTiming as AnchoredEvent).pointInCycle = 1 days)
        and
      IsEquivalent(((LD.administrationFrequency.cycle.cycleTiming as AnchoredEvent).cycle[1].cycleTiming as CodedRecurringEvent).repeatCode,  OncePerDayCode)
    )
    and
    exists (
      T.dosage LD where 
      IsEquivalent(LD.doseType, MaintenanceDoseCode)
        and
      LD.doseQuantity = 90 u 'mg'
        and
      IsEquivalent(LD.route, OralRouteCode)
        and
     ((LD.administrationFrequency.cycle.cycleTiming as AnchoredEvent).pointInCycle = 2 days)
        and
      IsEquivalent(((LD.administrationFrequency.cycle.cycleTiming as AnchoredEvent).cycle[1].cycleTiming as CodedRecurringEvent).repeatCode,  TwicePerDayCode)
    )
 
# =require Period.js.coffee
# =require Dispense.js.coffee
# =require StatementOfOccurrence.js.coffee
# =require StatementTopic.js.coffee
# =require Medication.js.coffee
# =require Indication.js.coffee
# =require ActionStatus.js.coffee
# =require StatementModality.js.coffee
# =require Dosage.js.coffee
# =require Patient.js.coffee
# =require CodeableConcept.js.coffee
# =require Identifier.js.coffee
# =require Practitioner.js.coffee
# =require Person.js.coffee
# =require Entity.js.coffee
@class MedicationTreatmentOrderOccurrence
@exports  MedicationTreatmentOrderOccurrence as quick.MedicationTreatmentOrderOccurrence
###
class QUICK.MedicationTreatmentOrderOccurrence
  constructor: (@json) ->
    super()
   
###*
Details about the clinical statement that were not represented at all or sufficiently in one of the attributes provided in a class. These may include for example a comment, an instruction, or a note associated with the statement.
### 
  additionalText: ->  @json['additionalText'] 
 
 
###*
The status of an action. It is expected that the range of values for statusCode (i.e., the value set) will vary by the subtypes of Action. For example, Proposal might have one of its status value as Declined.
### 
  currentStatus: -> 
    for x in @json['currentStatus'] 
      new ActionStatus(x)
     
   
###*
Dispensation details to be used only when needed, e.g., as part of a statement about a prescription or a dispensation event.
### 
  dispense: -> 
    for x in @json['dispense'] 
      new Dispense(x)
     
   
###*
Details for the dose or doses of medication administered or to be administered to the patient
### 
  dosage: -> 
    for x in @json['dosage'] 
      new Dosage(x)
     
   
###*
The encounter within which the clinical statement was created.
### 
  encounter: -> 
    for x in @json['encounter'] 
      new StatementOfOccurrence(x)
     
   
###*
The time when the ordered act is expected to be performed.
### 
  expectedPerformanceTime: -> 
    for x in @json['expectedPerformanceTime'] 
      new Period(x)
     
   
###*
Identifies a proposal that led to this order.
### 
  fromProposal: -> new StatementOfOccurrence( @json['fromProposal'] )
 
 
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
Identifies the medication being dispensed or administered.
### 
  medication: -> 
    for x in @json['medication'] 
      new Medication(x)
     
   
###*
The modality of a Clinical Statement describes the way the topic exists, happens, or is experienced.
### 
  modality: -> new StatementModality( @json['modality'] )
 
 
###*
The time at which the order was created.
### 
  orderedAtTime: ->  @json['orderedAtTime'] 
 
 
###*
The responsible person who places this order, e.g., physician. This may be different than the author of the order, e.g., clerk, who may be the statement's author.
### 
  orderedBy: -> 
    for x in @json['orderedBy'] 
      new Practitioner(x)
     
   
###*
The mode the order was received (such as by telephone, electronic, verbal, written). This describes 'how' the communication was done as opposed to dataSourceType which specifies the 'where' and 'from'.
### 
  originationMode: -> 
    for x in @json['originationMode'] 
      new CodeableConcept(x)
     
   
###*
Preferences are choices made by patients about options for care or treatment (including scheduling, care experience, and meeting of personal health goals) and the sharing and disclosure of their health information.
### 
  patientPreference: -> 
    for x in @json['patientPreference'] 
      new CodeableConcept(x)
     
   
###*
The specific condition under which the act being ordered is performed. For example, Pain, Shortness of Breath, Insomnia, Nausea.

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
Provider preferences are choices made by care providers relative to options for care or treatment (including scheduling, care experience, and meeting of personal health goals).
### 
  providerPreference: -> 
    for x in @json['providerPreference'] 
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
Characterizes how quickly the action must be initiated. Includes concepts such as stat, urgent, routine.
### 
  urgency: -> 
    for x in @json['urgency'] 
      new CodeableConcept(x)
     
   
