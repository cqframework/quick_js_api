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
Abstract class for concepts that represent how a medication is to be used by or administered to the patient.
 
# =require Range.js.coffee
# =require Quantity.js.coffee
# =require BodySite.js.coffee
# =require Schedule.js.coffee
# =require CodeableConcept.js.coffee
@class Dosage
@exports  Dosage as quick.Dosage
###
class QUICK.Dosage
  constructor: (@json) ->
    super()
   
###*
The frequency pattern for administration of doses. e.g., three times per day after meals
### 
  administrationFrequency: -> 
    for x in @json['administrationFrequency'] 
      new Schedule(x)
     
   
###*
The body site used for gaining access to the target body site for the purposes of the substance administration. This is the anatomic site where the substance first enters the body, e.g., left subclavian vein.
### 
  approachBodySite: -> 
    for x in @json['approachBodySite'] 
      new BodySite(x)
     
   
###*
The amount of the therapeutic or other substance given at one administration event. e.g., 500 mg, 1 tablet, 1 teaspoon
### 
  doseQuantity: -> 
    for x in @json['doseQuantity'] 
      new Quantity(x)
     
   
###*
The type of dose.  E.g., initial, maintenance, loading.
### 
  doseType: -> 
    for x in @json['doseType'] 
      new CodeableConcept(x)
     
   
###*
Represents the actual time the substance is infused. Note the difference between infuseOver and duration of treatment (specified in administrationFrequency). An order may call for infusing a patient TID for an hour each time over a duration of 5 days.
### 
  infuseOver: -> 
    for x in @json['infuseOver'] 
      new Quantity(x)
     
   
###*
A coded value indicating the method by which the substance is introduced into or onto the body. Most commonly used for injections. Examples: Slow Push; Deep IV. Terminologies used often pre-coordinate this term with the route and or form of administration.
### 
  method: -> 
    for x in @json['method'] 
      new CodeableConcept(x)
     
   
###*
The speed with which the substance is introduced into the subject. Typically the rate for an infusion. e.g., 200ml in 2 hours.
### 
  rate: -> 
    for x in @json['rate'] 
      new Quantity(x)
     
   
###*
Change in the dosing rate; usually an increase for a patient who is initiating tube feeding. E.g., 20 mL/hour.
### 
  rateIncrement: -> 
    for x in @json['rateIncrement'] 
      new Range(x)
     
   
###*
Period of time after which the deliveryRateIncrement should be attempted. E.g., 4 hours.
### 
  rateIncrementInterval: -> 
    for x in @json['rateIncrementInterval'] 
      new Range(x)
     
   
###*
The physical route through which the substance is administered. E.g., IV, PO.
### 
  route: -> 
    for x in @json['route'] 
      new CodeableConcept(x)
     
   
###*
The body site where the substance is delivered.
### 
  targetBodySite: -> 
    for x in @json['targetBodySite'] 
      new BodySite(x)
     
   
