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
IV fluid administration that may consist of one or more additives mixed into a diluent. Additives and diluents are represented as constituents with the appropriate constituentType.
 
@class CompositeIntravenousMedicationAdministration
@exports  CompositeIntravenousMedicationAdministration as quick.CompositeIntravenousMedicationAdministration
###
class QUICK.CompositeIntravenousMedicationAdministration
  constructor: (@json) ->
    super()
   
###*
The constituents of this composite IV medication.
### 
  constituent: -> 
    for x in @json['constituent'] 
      new Constituent(x)
     
   
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
Identifies the medication being dispensed or administered.
### 
  medication: -> 
    for x in @json['medication'] 
      new Medication(x)
     
   
###*
The total volume of the overall mixture such as the volume of the bag
### 
  totalVolume: -> 
    for x in @json['totalVolume'] 
      new Quantity(x)
     
   
