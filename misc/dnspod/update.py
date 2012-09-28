#!/usr/bin/env python
#-*- coding:utf-8 -*-

import httplib, urllib
import socket
import time
import os
import sys
import json
import getopt
from dnslib import *

DOMAIN = "sunshine-library.org"

def fetch_domain_id(domain):
    request = DomainInfoRequest(domain)
    return request.get_id()

def fetch_record_id(domain_id, hostname):
    if domain_id == None:
        return None
    request = RecordInfoRequest(domain_id, hostname)
    record_id = request.get_id()
    if record_id == None:
        request = RecordCreateRequest(domain_id, hostname, "127.0.0.1")
        record_id = request.do_update()
    return record_id

def ddns(ip):
    hostname = socket.gethostname()

    domain_id = fetch_domain_id(DOMAIN)
    record_id = fetch_record_id(domain_id, hostname)
    if domain_id == None or record_id == None:
        return False

    request = RecordDdnsRequest(domain_id, record_id, hostname, ip)
    return request.do_update()

def getip():
    try:
        sock = socket.create_connection(('ns1.dnspod.net', 6666))
        ip = sock.recv(16)
        sock.close()
        return ip
    except Exception, e:
        log(e)
        return None

def main_loop():
    current_ip = None
    while True:
        log("Looking up current IP...")
        ip = getip()
        if ip == None:
            log("IP Not Found")
        else:
            log("IP Found: ", ip)
            if current_ip != ip:
                log("Updating new IP...")
                if ddns(ip):
                    log("IP updated")
                    current_ip = ip
        sys.stdout.flush()
        time.sleep(60)


if __name__ == '__main__':
    pid = os.fork()
    if pid:
        log("Received Child process id:", pid)
        try:
            pidFile = open("/var/local/dnspod/pypod.pid", "w")
            pidFile.write(str(pid))
            pidFile.close
        except Exception, e:
            log("Could not open PID file for writing")
        log('Shutting down parent process')
    else:
        log('Starting child process')
        main_loop()
