#!/usr/bin/env python
#-*- coding:utf-8 -*-

import httplib, urllib
import time
import os, sys
import json

def log(*args):
    args = map(lambda x: str(x), args)
    print timestamp(), ' '.join(args)

def timestamp():
    return '[' + time.strftime('%x %X') + ']'

class ApiRequest(object):

    base_params = dict(
            login_email="",
            login_password="",
            format="json"
            )
    headers = {
            "Content-type": "application/x-www-form-urlencoded",
            "Accept": "text/json",
            "UserAgent": "PyDns Script/1.0 (ukisami@gmail.com"
            }

    def __init__(self, path, **kwargs):
        self.path = path
        self.params = dict(ApiRequest.base_params, **kwargs)

    def get_response(self):
        status = data = None
        try:
            conn = httplib.HTTPSConnection("dnsapi.cn")
            conn.request("POST", self.path, urllib.urlencode(self.params), ApiRequest.headers)

            response = conn.getresponse()
            status = response.status
            reason = response.reason
            data = response.read()
            conn.close()
            log(data)
        except Exception, e:
            log("Could not connect to server.", e)

        return status, data

class DomainInfoRequest(ApiRequest):
    def __init__(self, domain):
        super(DomainInfoRequest, self).__init__("/Domain.Info", domain=domain)
        self.domain = domain

    def get_id(self):
        status, data = self.get_response()
        if status == 200:
            try:
                data = json.loads(data)
                return int(data["domain"]["id"])
            except Exception, e:
                log("Failed retrieving domain_id: ", e)
        return None

class RecordInfoRequest(ApiRequest):
    def __init__(self, domain_id, sub_domain):
        super(RecordInfoRequest, self).__init__("/Record.List", domain_id=domain_id, sub_domain=sub_domain)
        self.domain_id = domain_id
        self.sub_domain = sub_domain

    def get_id(self):
        if self.domain_id != None and self.sub_domain != None:
            status, data = self.get_response()
            try:
                data = json.loads(data)
                return int(data["records"][0]["id"])
            except Exception, e:
                log("Failed retrieving record_id:", e)
        return None

class RecordCreateRequest(ApiRequest):
    def __init__(self, domain_id, sub_domain, ip):
        self.domain_id = domain_id
        self.sub_domain = sub_domain
        self.ip = ip
        params = self.get_params(domain_id, sub_domain, ip)
        super(RecordCreateRequest, self).__init__("/Record.Create", **params)

    def get_params(self, domain_id, sub_domain, ip):
        return {"value": ip, "domain_id": domain_id, "sub_domain": sub_domain, "record_type": "A", "record_line": "默认", "ttl": "600"}

    def do_update(self):
        if self.domain_id != None and self.sub_domain != None:
            status, data = self.get_response()
            try:
                data =json.loads(data)
                if status == 200:
                    return int(data["record"]["id"])
            except Exception, e:
                log("Error creating record:", e)
        return None

class RecordDdnsRequest(ApiRequest):

    def __init__(self, domain_id, record_id, sub_domain, ip):
        self.sub_domain = sub_domain
        self.domain_id = domain_id
        self.record_id = record_id
        self.ip = ip
        params = self.get_params(domain_id, record_id, sub_domain, ip)
        super(RecordDdnsRequest, self).__init__("/Record.Ddns", **params)

    def get_params(self, domain_id, record_id, sub_domain, ip):
        return {"value": ip, "domain_id": domain_id, "record_id": record_id, "sub_domain": sub_domain, "record_line": "默认"}

    def do_update(self):
        if self.domain_id != None and self.record_id != None:
            status, data = self.get_response()
            return status == 200
        else:
            return False
