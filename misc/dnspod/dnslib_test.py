#!/usr/bin/env python
#-*- coding:utf-8 -*-

from dnslib import *

request = DomainInfoRequest("sunshine-library.org")
domain_id = request.get_id()
print domain_id

request = RecordCreateRequest(domain_id, "test", "127.0.0.1")
record_id = request.do_update()
print record_id

request = RecordInfoRequest(domain_id, "test")
record_id = request.get_id()
print record_id

request = RecordDdnsRequest(domain_id, record_id, "test", "127.0.0.2")
success = request.do_update()
print success
