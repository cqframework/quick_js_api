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
The recurrence pattern of events, e.g., three times a day after meals. 

A schedule that specifies an event that may occur multiple times. Schedules should not be used to record when events did happen but rather when actions or events are expected or requested to occur. 

A schedule can be either a list of 'calendar time' events - periods on which the event ought to occur, or a single event with repeating criteria, or just repeating criteria with no actual event as represented by the 'cycle' concept and attribute.
 
# =require Period.js.coffee
# =require Extension.js.coffee
# =require Cycle.js.coffee
@class Schedule
@exports  Schedule as quick.Schedule
###
class QUICK.Schedule
  constructor: (@json) ->
    super()
   
###*
Identifies a repeating pattern to the intended time periods.

If present, the Schedule.event indicates the time of the first occurrence.
### 
  cycle: -> 
    for x in @json['cycle'] 
      new Cycle(x)
     
   
###*
Identifies specific time periods when the event should occur.

Some schedules are just explicit lists of times.
### 
  event: -> 
    for x in @json['event'] 
      new Period(x)
     
   
  extension: -> 
    for x in @json['extension'] 
      new Extension(x)
     
   
  id: ->  @json['id'] 
 
 
