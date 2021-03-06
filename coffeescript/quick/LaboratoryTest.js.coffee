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
A procedure to test a tissue or fluid specimen from a patient, e.g., complete blood count, blood culture.
 
# =require Specimen.js.coffee
# =require Schedule.js.coffee
# =require BodySite.js.coffee
# =require CodeableConcept.js.coffee
@class LaboratoryTest
@exports  LaboratoryTest as quick.LaboratoryTest
###
class QUICK.LaboratoryTest
  constructor: (@json) ->
    super()
   
###*
The body site used for gaining access to the target body site. E.g., femoral artery for a coronary angiography.
### 
  approachBodySite: -> 
    for x in @json['approachBodySite'] 
      new BodySite(x)
     
   
###*
Specification of how the specimen for testing should be obtained
### 
  collectionMethod: -> 
    for x in @json['collectionMethod'] 
      new CodeableConcept(x)
     
   
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
Special instructions on how to handle a laboratory specimen. For example, 'Keep on ice'.
### 
  specialHandling: -> 
    for x in @json['specialHandling'] 
      new CodeableConcept(x)
     
   
###*
The source of the laboratory specimen to be collected.
### 
  specimenSource: -> 
    for x in @json['specimenSource'] 
      new Specimen(x)
     
   
###*
The pathogen or pathogens that are felt to be the most likely cause of the patient's condition that led to the laboratory procedure proposal. For instance, Staphylococcus, Streptococcus, Pseudomonas, Neisseria.
### 
  suspectedPathogen: -> 
    for x in @json['suspectedPathogen'] 
      new CodeableConcept(x)
     
   
###*
The body site where the procedure takes place.  E.g., left lower arm for fracture reduction.
### 
  targetBodySite: -> 
    for x in @json['targetBodySite'] 
      new BodySite(x)
     
   
