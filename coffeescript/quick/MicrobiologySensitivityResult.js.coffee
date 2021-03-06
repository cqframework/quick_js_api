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
Findings of the microbiology sensitivity test. This element is used to specify traditional, culture-isolate- run susceptibilities. It is not used to specify genetic methods for organism sensitivity.
 
# =require Specimen.js.coffee
# =require StatementOfOccurrence.js.coffee
# =require BodySite.js.coffee
# =require OrganismSensitivity.js.coffee
# =require CodeableConcept.js.coffee
# =require RelatedObservation.js.coffee
@class MicrobiologySensitivityResult
@exports  MicrobiologySensitivityResult as quick.MicrobiologySensitivityResult
###
class QUICK.MicrobiologySensitivityResult
  constructor: (@json) ->
    super()
   
###*
Indicates where on the subject's body the observation was made.
### 
  bodySite: -> 
    for x in @json['bodySite'] 
      new BodySite(x)
     
   
###*
The assessment made based on the result of the observation.
### 
  interpretation: -> 
    for x in @json['interpretation'] 
      new CodeableConcept(x)
     
   
###*
The technique or mechanism used to perform the observation.
### 
  method: -> 
    for x in @json['method'] 
      new CodeableConcept(x)
     
   
###*
Identifies what type of observation was performed. e.g., body temperature
### 
  name: -> new CodeableConcept( @json['name'] )
 
 
###*
An order placed by a provider that led to this observation result
### 
  order: -> 
    for x in @json['order'] 
      new StatementOfOccurrence(x)
     
   
###*
Components of the microbiology sensitivity result. Each of the OrganismSensitivity items represent a the sensitivity of an organism to one agent.
### 
  organismSensitivity: -> 
    for x in @json['organismSensitivity'] 
      new OrganismSensitivity(x)
     
   
###*
Observations related to this observation in some way, e.g., used to derive this observation, previous versions of this observation.

Related observations do not include components. Those are modeled in ObservationResultGroup. 
### 
  relatedObservation: -> 
    for x in @json['relatedObservation'] 
      new RelatedObservation(x)
     
   
###*
An estimate of the degree to which quality issues have impacted on the value reported. e.g., result is ok, measurement still ongoing, results are questionable. Usually, unreliable results are not recorded, but that is not always possible. In such cases, this attribute makes the receiver aware of the quality of the result.
### 
  reliability: -> 
    for x in @json['reliability'] 
      new CodeableConcept(x)
     
   
###*
The specimen that was used when this observation was made.
Observations are not made on specimens themselves; they are made on a subject, but usually by the means of a specimen. Note that although specimens are often involved, they are not always tracked and reported explicitly. Also note that observation resources are often used in contexts that track the specimen explicity (e.g. Diagnostic Report).
### 
  specimen: -> 
    for x in @json['specimen'] 
      new Specimen(x)
     
   
###*
The status of the result value. e.g., preliminary, final
### 
  status: -> 
    for x in @json['status'] 
      new CodeableConcept(x)
     
   
###*
Method by which the observation result was validated, e.g., human review, sliding average.
### 
  validationMethod: -> 
    for x in @json['validationMethod'] 
      new CodeableConcept(x)
     
   
