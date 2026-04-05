# OpenWrt Unbound stats collector

For regular stats only - no extended
```
# TYPE unbound_num_queries_ip_ratelimited_total counter
# TYPE unbound_num_queries_cookie_valid_total counter
# TYPE unbound_num_queries_cookie_client_total counter
# TYPE unbound_num_queries_cookie_invalid_total counter
# TYPE unbound_num_queries_discard_timeout_total counter
# TYPE unbound_num_queries_wait_limit_total counter
# TYPE unbound_cachehits_total counter
# TYPE unbound_cachemiss_total counter
# TYPE unbound_prefetch_total counter
# TYPE unbound_num_queries_timed_out_total counter
# TYPE unbound_query_queue_time_us_max gauge
# TYPE unbound_num_expired_total counter
# TYPE unbound_num_recursivereplies_total counter
# TYPE unbound_num_dns_error_reports_total counter
# TYPE unbound_requestlist_avg gauge
# TYPE unbound_requestlist_max gauge
# TYPE unbound_requestlist_overwritten_total counter
# TYPE unbound_requestlist_exceeded_total counter
# TYPE unbound_requestlist_current_all gauge
# TYPE unbound_requestlist_current_user gauge
# TYPE unbound_recursion_time_avg gauge
# TYPE unbound_recursion_time_median gauge
unbound_num_queries_total{} 32827
unbound_num_queries_ip_ratelimited_total{} 0
unbound_num_queries_cookie_valid_total{} 0
unbound_num_queries_cookie_client_total{} 0
unbound_num_queries_cookie_invalid_total{} 0
unbound_num_queries_discard_timeout_total{} 2
unbound_num_queries_wait_limit_total{} 0
unbound_cachehits_total{} 26013
unbound_cachemiss_total{} 6814
unbound_prefetch_total{} 1305
unbound_num_queries_timed_out_total{} 0
unbound_query_queue_time_us_max{} 0
unbound_num_expired_total{} 0
unbound_num_recursivereplies_total{} 6812
unbound_num_dns_error_reports_total{} 0
unbound_requestlist_avg{} 0.751201
unbound_requestlist_max{} 15
unbound_requestlist_overwritten_total{} 0
unbound_requestlist_exceeded_total{} 0
unbound_requestlist_current_all{} 0
unbound_requestlist_current_user{} 0
unbound_recursion_time_avg{} 0.052909
unbound_recursion_time_median{} 0.0139971
```

## Dependencies

- luci-app-unbound
- unbound-control
- prometheus-node-exporter-lua

## Required Unbound Settings

Add the following settings (under Services → Unbound DNS → Files → Extended)
```
remote-control:
    control-enable: yes
    control-interface: /run/unbound.ctl
    control-use-cert: no
```

## Install Latest
```bash
wget https://marinierb.github.io/prometheus-node-exporter-lua-unbound/prometheus-node-exporter-lua-unbound.apk
apk add --allow-untrusted prometheus-node-exporter-lua-unbound-latest.apk
```

## Test it
```bash
curl -s http://router:9100/metrics | grep unbound
```

## That's it!

Enjoy!
