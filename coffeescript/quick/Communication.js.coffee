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
A communication is a message sent between a sender and a recipient for a purpose and about a topic. Messages may be multipart each part having its own content-type.
 
@class Communication
@exports  Communication as quick.Communication
###
class QUICK.Communication
  constructor: (@json) ->
    super()
   
###*
The communication medium, e.g., email, fax
### 
  medium: -> 
    for x in @json['medium'] 
      new CodeableConcept(x)
     
   
###*
Text and other information to be communicated to the recipient
### 
  message: -> 
    for x in @json['message'] 
      new Attachment(x)
     
   
###*
The entity (e.g., person, organization, clinical information system, or device) which is the intended target of the communication
### 
  recipient: -> 
    for x in @json['recipient'] 
      new Entity(x)
     
   
###*
Any statement that is pertinent to the message
### 
  relatedStatement: -> 
    for x in @json['relatedStatement'] 
      new ClinicalStatement(x)
     
   
###*
The entity (e.g., person, organization, clinical information system, or device) which is the source of the communication
### 
  sender: -> 
    for x in @json['sender'] 
      new Entity(x)
     
   
