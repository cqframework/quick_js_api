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
A sample of tissue, blood, urine, water, air, etc., taken for the purposes of diagnostic examination or evaluation.
 
# =require BodySite.js.coffee
# =require EntityCharacteristic.js.coffee
# =require Patient.js.coffee
# =require CodeableConcept.js.coffee
# =require Identifier.js.coffee
@class Specimen
@exports  Specimen as quick.Specimen
###
class QUICK.Specimen
  constructor: (@json) ->
    super()
   
###*
The characteristics of this entity.
### 
  characteristic: -> 
    for x in @json['characteristic'] 
      new EntityCharacteristic(x)
     
   
###*
The technique used to collect the specimen, e.g., aspiration, scraping
### 
  collectionMethod: -> 
    for x in @json['collectionMethod'] 
      new CodeableConcept(x)
     
   
###*
Site from which the specimen was collected.
### 
  collectionSite: -> 
    for x in @json['collectionSite'] 
      new BodySite(x)
     
   
###*
<font color="#0f0f0f">The entity's unique identifier.  Used for internal tracking purposes.  It must be provided if user wants it returned as part of any output, otherwise it will be auto-generated, if needed, by CDS system.  Does not need to be the entity's "real" identifier. </font>
### 
  id: -> 
    for x in @json['id'] 
      new Identifier(x)
     
   
###*
The identifier of a set of constraints placed on an Entity. If there are multiple templates specified for the element, then the element must satisfy ALL constraints defined in ANY template at that level.
### 
  profileId: -> 
    for x in @json['profileId'] 
      new Identifier(x)
     
   
###*
The patient from whom the specimen was obtained.
### 
  subject: -> 
    for x in @json['subject'] 
      new Patient(x)
     
   
###*
The kind of material, e.g., blood, urine, tissue
### 
  type: -> new CodeableConcept( @json['type'] )
 
 
