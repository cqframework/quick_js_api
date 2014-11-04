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
Demographics and qualification information for an individual who is directly or indirectly involved in the provisioning of healthcare.

Practitioner covers all individuals who are engaged in the healthcare process and healthcare-related services as part of their professional responsibilities. This class is used for attribution of activities and responsibilities to these individuals. Practitioners include (but are not limited to):

<ul>
 <li>physicians, dentists, pharmacists</li>
 <li>physician assistants, nurses, scribes</li>
 <li>midwives, dietitians, therapists, optometrists, paramedics</li>
 <li>medical technicians, laboratory scientists, prosthetic technicians, radiographers</li>
 <li>social workers, professional home carers, official volunteers</li>
 <li>receptionists handling patient registration</li>
 <li>IT personnel merging or unmerging patient records</li>
</ul>
 
# =require Qualification.js.coffee
# =require Contact.js.coffee
# =require HumanName.js.coffee
# =require Address.js.coffee
# =require EntityCharacteristic.js.coffee
# =require Organization.js.coffee
# =require CodeableConcept.js.coffee
# =require Identifier.js.coffee
@class Practitioner
@exports  Practitioner as quick.Practitioner
###
class QUICK.Practitioner
  constructor: (@json) ->
    super()
   
###*
The place or the name of the place where a person is located or may be reached.
### 
  address: -> 
    for x in @json['address'] 
      new Address(x)
     
   
###*
The date and time of birth for the individual.
### 
  birthTime: ->  @json['birthTime'] 
 
 
###*
The characteristics of this entity.
### 
  characteristic: -> 
    for x in @json['characteristic'] 
      new EntityCharacteristic(x)
     
   
###*
The person's ethnicity.  An ethnicity or ethnic group is a group of people whose members identify with each other through a common heritage.  E.g., Hispanic.
### 
  ethnicity: -> 
    for x in @json['ethnicity'] 
      new CodeableConcept(x)
     
   
###*
Administrative Gender - the gender that the patient is considered to have for administration and record keeping purposes.
### 
  gender: -> 
    for x in @json['gender'] 
      new CodeableConcept(x)
     
   
###*
<font color="#0f0f0f">The entity's unique identifier.  Used for internal tracking purposes.  It must be provided if user wants it returned as part of any output, otherwise it will be auto-generated, if needed, by CDS system.  Does not need to be the entity's "real" identifier. </font>
### 
  id: -> 
    for x in @json['id'] 
      new Identifier(x)
     
   
###*
Languages which may be used to communicate with this person.
### 
  languages: -> 
    for x in @json['languages'] 
      new CodeableConcept(x)
     
   
###*
A name by which the patient is known.
### 
  name: -> 
    for x in @json['name'] 
      new HumanName(x)
     
   
###*
The organization that the practitioner represents.
### 
  organization: -> 
    for x in @json['organization'] 
      new Organization(x)
     
   
###*
The person's language of preference.  E.g., English.
### 
  preferredLanguage: -> 
    for x in @json['preferredLanguage'] 
      new CodeableConcept(x)
     
   
###*
The identifier of a set of constraints placed on an Entity. If there are multiple templates specified for the element, then the element must satisfy ALL constraints defined in ANY template at that level.
### 
  profileId: -> 
    for x in @json['profileId'] 
      new Identifier(x)
     
   
###*
Qualifications obtained by training and certification
### 
  qualification: -> 
    for x in @json['qualification'] 
      new Qualification(x)
     
   
###*
The person's race.  Race is a classification of humans into large groups by various factors, such as heritable phenotypic characteristics or geographic ancestry.  E.g., White, Asian.
### 
  race: -> 
    for x in @json['race'] 
      new CodeableConcept(x)
     
   
###*
Roles which this practitioner is authorized perform for the organization.
### 
  role: -> 
    for x in @json['role'] 
      new CodeableConcept(x)
     
   
###*
The professional specialty of the practitioner, e..g, cardiologist, midwife
### 
  speciality: -> 
    for x in @json['speciality'] 
      new CodeableConcept(x)
     
   
###*
A locatable resource of a person such as a web page, a telephone number (voice, fax or some other resource mediated by telecommunication equipment), an e-mail address, or any other locatable resource.
### 
  telecom: -> 
    for x in @json['telecom'] 
      new Contact(x)
     
   
