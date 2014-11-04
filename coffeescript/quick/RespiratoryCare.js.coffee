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
Procedures that encompass supplemental oxygen (eg, nasal cannula, face mask), BiPAP/CPAP, and mechanical ventilation.  

Note: While these are vastly different respiratory care concepts, the associated data elements can be constrained through templates.
 
# =require Range.js.coffee
# =require Schedule.js.coffee
# =require BodySite.js.coffee
# =require CodeableConcept.js.coffee
@class RespiratoryCare
@exports  RespiratoryCare as quick.RespiratoryCare
###
class QUICK.RespiratoryCare
  constructor: (@json) ->
    super()
   
###*
The body site used for gaining access to the target body site. E.g., femoral artery for a coronary angiography.
### 
  approachBodySite: -> 
    for x in @json['approachBodySite'] 
      new BodySite(x)
     
   
###*
Expiratory positive airway pressure, often expressed in cmH20 in the United States. Example: 5 cmH2O
### 
  ePAP: -> 
    for x in @json['ePAP'] 
      new Range(x)
     
   
###*
Fraction of inspired oxygen, expressed as a percentage. For example, 100%.
### 
  fiO2: -> 
    for x in @json['fiO2'] 
      new Range(x)
     
   
###*
Inspiratory positive airway pressure, often expressed in cmH20 in the United States. For example, 10 cmH2O.
### 
  iPAP: -> 
    for x in @json['iPAP'] 
      new Range(x)
     
   
###*
Specification of the duration of the positive airway pressume applied by a mechanical ventilator. For example, 1 second.
### 
  inspiratoryTime: -> 
    for x in @json['inspiratoryTime'] 
      new Range(x)
     
   
###*
Describes the kinds of precautions that should be taken for the patient. Values include: Airborne Precautions, Contact Precautions, Droplet Precautions, Standard Precautions, Neutropenic (Reverse) Precautions.
### 
  isolationCode: -> 
    for x in @json['isolationCode'] 
      new CodeableConcept(x)
     
   
###*
The rate at which oxygen is administered to the patient; generally in liters per minute
### 
  oxygenFlowRate: -> 
    for x in @json['oxygenFlowRate'] 
      new Range(x)
     
   
###*
Positive end expiratory pressure, the alveolar pressure above atmospheric pressure that exists at the end of expiration, often expressed in cmH20 in the United States. For example, 5 cmH2O.
### 
  pEEP: -> 
    for x in @json['pEEP'] 
      new Range(x)
     
   
###*
Specification of the maximum allowable rate of airflow delivered by a mechanical ventilator. For example, 60 L/min.
### 
  peakFlowRate: -> 
    for x in @json['peakFlowRate'] 
      new Range(x)
     
   
###*
Specification of the maximum airway pressure allowed to be delivered by the ventilator in order to prevent barotrauma, applies to volume-controlled ventilation modes. For example, 35 cmH2O.
### 
  peakInspiratoryPressure: -> 
    for x in @json['peakInspiratoryPressure'] 
      new Range(x)
     
   
###*
Specification of the additional amount of pressure that is added to a mechanical ventilation mode, often CPAP mode.  Not to be confused with pressure control ventilation mode. For example, 500 mL
### 
  pressureSupport: -> 
    for x in @json['pressureSupport'] 
      new Range(x)
     
   
###*
This is the code that identifies the procedure with as much specificity as available, or as required.  E.g., appendectomy, coronary artery bypass graft surgery.
### 
  procedureCode: -> new CodeableConcept( @json['procedureCode'] )
 
 
###*
Describes the method used for the procedure and can vary depending on the procedure.  For example, a surgical procedure method might be laparoscopic surgery or robotic surgery; an imaging procedure such as a chest radiograph might have methods that represent the views such as PA and lateral; a laboratory procedure like urinalysis might have a method of clean catch; a respiratory care procedure such as supplemental oxygen might have a method of nasal cannula, hood, face mask, or non-rebreather mask.
### 
  procedureMethod: -> 
    for x in @json['procedureMethod'] 
      new CodeableConcept(x)
     
   
###*
If the procedure is repeated, the frequency pattern for repetitions.
### 
  procedureSchedule: -> 
    for x in @json['procedureSchedule'] 
      new Schedule(x)
     
   
###*
Number of machine-delivered breaths per minute, in the context of mechanical ventilation, expressed as breaths/minute.  For example, 14 breaths/minute.
### 
  respiratoryRate: -> 
    for x in @json['respiratoryRate'] 
      new Range(x)
     
   
###*
Target oxygen saturation, expressed as a percentage. For instance, 95-100%.
### 
  spO2Range: -> 
    for x in @json['spO2Range'] 
      new Range(x)
     
   
###*
Titration instructions to achieve target oxygen saturation. An example might include: "Titrate oxygen to maintain SpO2 &gt; 93%".
### 
  spO2Titration: -> 
    for x in @json['spO2Titration'] 
      new Range(x)
     
   
###*
The body site where the procedure takes place.  E.g., left lower arm for fracture reduction.
### 
  targetBodySite: -> 
    for x in @json['targetBodySite'] 
      new BodySite(x)
     
   
###*
Volume of air delivered with each machine-delivered breath, often expressed in mL in the United States. For example, 500 mL.
### 
  tidalVolume: -> 
    for x in @json['tidalVolume'] 
      new Range(x)
     
   
###*
Primary setting on a mechanical ventilator that specifies how machine breaths will be delivered to a patient.
Examples:Assist Control (AC), Synchronized Intermittent Mandatory Ventilation (SIMV), Pressure Support Ventilation (PS or PSV), Pressure-Regulated Volume Control (PRVC).
### 
  ventilatorMode: -> 
    for x in @json['ventilatorMode'] 
      new CodeableConcept(x)
     
   
