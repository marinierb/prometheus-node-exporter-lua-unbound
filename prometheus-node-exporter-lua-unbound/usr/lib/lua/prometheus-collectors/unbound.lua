local function scrape()
    local metric_names = {
        "total.num.queries = unbound_num_queries_total",
        "total.num.queries.ip.ratelimited = unbound_num_queries_ip_ratelimited_total",
        "total.num.queries.cookie.valid = unbound_num_queries_cookie_valid_total",
        "total.num.queries.cookie.client = unbound_num_queries_cookie_client_total",
        "total.num.queries.cookie.invalid = unbound_num_queries_cookie_invalid_total",
        "total.num.queries.discard.timeout = unbound_num_queries_discard_timeout_total",
        "total.num.queries.wait.limit = unbound_num_queries_wait_limit_total",
        "total.num.cachehits = unbound_cachehits_total",
        "total.num.cachemiss = unbound_cachemiss_total",
        "total.num.prefetch = unbound_prefetch_total",
        "total.num.queries.timed.out = unbound_num_queries_timed_out_total",
        "total.query.queue.time.us.max = unbound_query_queue_time_us_max_total",
        "total.num.expired = unbound_num_expired_total",
        "total.num.recursivereplies = unbound_num_recursivereplies_total",
        "total.num.dns.error.reports = unbound_num_dns_error_reports_total",
        "total.requestlist.avg = unbound_requestlist_avg_total",
        "total.requestlist.max = unbound_requestlist_max_total",
        "total.requestlist.overwritten = unbound_requestlist_overwritten_total",
        "total.requestlist.exceeded = unbound_requestlist_exceeded_total",
        "total.requestlist.current.all = unbound_requestlist_current_all_total",
        "total.requestlist.current.user = unbound_requestlist_current_user_total",
        "total.recursion.time.avg = unbound_recursion_time_avg_total",
        "total.recursion.time.median = unbound_recursion_time_median_total",
    }

    local metrics = {}
    for _, entry in ipairs(metric_names) do
        if not entry:match("^%s*%-%-") then
            local key, name = entry:match("^%s*([%w%.]+)%s*=%s*([%w_]+)%s*$")
            if key and name then
                metrics[key] = metric(name, "counter")
            end
        end
    end

    local handle = io.popen("/usr/sbin/unbound-control stats_noreset | sed 's/_/./g'")
    if not handle then
        return nil, "failed to run unbound-control"
    end
    local out = handle:read("*a")
    handle:close()

    for line in out:gmatch("[^\r\n]+") do
        local key, val = line:match("^([%w%.]+)=(%-?[%d%.]+)$")
        if key and val then
            local n = tonumber(val)
            if metrics[key] then
                metrics[key]({}, n)
            end
        end
    end
end

return { scrape = scrape }
