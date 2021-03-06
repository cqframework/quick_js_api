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
The actual performance or execution of a healthcare-related action, e.g., 3rd dose of Hepatitis B vaccine administered on Dec 4th 2012, appendectomy performed today.
 
# =require Period.js.coffee
# =require Indication.js.coffee
# =require StatementOfOccurrence.js.coffee
# =require ActionStatus.js.coffee
# =require Participant.js.coffee
# =require CodeableConcept.js.coffee
@class Performance
@exports  Performance as quick.Performance
###
class QUICK.Performance
  constructor: (@json) ->
    super()
   
###*
Attribute that specifies the component of a composite action that was performed. For instance, the fulfillment of a prescription may result in both a substance administration event and a dispense event, thus resulting in two actions being performed.

let VancoDoseAdmin =
  [MedicationTreatment, Performance: "Hospital measures-IV Vancomycin"] V 
    where
    dosage[1].route in "Hospital measures-Route IV"
      and IsEquivalent(actionPerformed, DoseAdministrationActionCode)
### 
  actionPerformed: -> 
    for x in @json['actionPerformed'] 
      new CodeableConcept(x)
     
   
###*
The status of an action. It is expected that the range of values for statusCode (i.e., the value set) will vary by the subtypes of Action. For example, Proposal might have one of its status value as Declined.
### 
  currentStatus: -> 
    for x in @json['currentStatus'] 
      new ActionStatus(x)
     
   
###*
Identifies a plan that is partly or wholly enacted by the performance of this act
### 
  enactsPlan: -> 
    for x in @json['enactsPlan'] 
      new StatementOfOccurrence(x)
     
   
###*
Identifies a proposal that led to this order.
### 
  fromProposal: -> 
    for x in @json['fromProposal'] 
      new StatementOfOccurrence(x)
     
   
###*
Identifies an order that is partly or wholly filled by the performance of this act
### 
  fulfillsOrder: -> 
    for x in @json['fulfillsOrder'] 
      new StatementOfOccurrence(x)
     
   
###*
Reason or justification for the action. Reasons may also be specified for not performing an action. 
### 
  indication: -> 
    for x in @json['indication'] 
      new Indication(x)
     
   
###*
Preferences are choices made by patients about options for care or treatment (including scheduling, care experience, and meeting of personal health goals) and the sharing and disclosure of their health information.
### 
  patientPreference: -> 
    for x in @json['patientPreference'] 
      new CodeableConcept(x)
     
   
###*
The overall time period in which the action is performed. This may be different than the scheduled time or the expected performance time. Time for different activities performed within this action can be specified as subTasks.
### 
  performanceTime: -> 
    for x in @json['performanceTime'] 
      new Period(x)
     
   
###*
The persons who perform this action, e.g., the person who administered the medication, performed the surgery. 

A performance may have many participants In comparison, an order or a plan has one participant typically. Hence, in performance many participants can be described along with their specific roles.
### 
  performedBy: -> 
    for x in @json['performedBy'] 
      new Participant(x)
     
   
###*
Provider preferences are choices made by care providers relative to options for care or treatment (including scheduling, care experience, and meeting of personal health goals).
### 
  providerPreference: -> 
    for x in @json['providerPreference'] 
      new CodeableConcept(x)
     
   
###*
The past statuses of this action, e.g., an order may evolve from draft to placed to in progress to completed or canceled.
### 
  statusHistory: -> 
    for x in @json['statusHistory'] 
      new ActionStatus(x)
     
   
