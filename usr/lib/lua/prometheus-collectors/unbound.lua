local function scrape()
    local metric_names = {
        "total.num.queries = unbound_total_num_queries",
        "total.num.queries_ip_ratelimited = unbound_total_num_queries_ip_ratelimited",
        "total.num.queries_cookie_valid = unbound_total_num_queries_cookie_valid",
        "total.num.queries_cookie_client = unbound_total_num_queries_cookie_client",
        "total.num.queries_cookie_invalid = unbound_total_num_queries_cookie_invalid",
        "total.num.queries_discard_timeout = unbound_total_num_queries_discard_timeout",
        "total.num.queries_wait_limit = unbound_total_num_queries_wait_limit",
        "total.num.cachehits = unbound_total_cachehits",
        "total.num.cachemiss = unbound_total_cachemiss",
        "total.num.prefetch = unbound_total_prefetch",
        "total.num.queries_timed_out = unbound_total_num_queries_timed_out",
        "total.query.queue_time_us.max = unbound_total_query_queue_time_us_max",
        "total.num.expired = unbound_total_num_expired",
        "total.num.recursivereplies = unbound_total_num_recursivereplies",
        "total.num.dns_error_reports = unbound_total_num_dns_error_reports",
        "total.requestlist.avg = unbound_total_requestlist_avg",
        "total.requestlist.max = unbound_total_requestlist_max",
        "total.requestlist.overwritten = unbound_total_requestlist_overwritten",
        "total.requestlist.exceeded = unbound_total_requestlist_exceeded",
        "total.requestlist.current.all = unbound_total_requestlist_current_all",
        "total.requestlist.current.user = unbound_total_requestlist_current_user",
        "total.recursion.time.avg = unbound_total_recursion_time_avg",
        "total.recursion.time.median = unbound_total_recursion_time_median",
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

    local handle = io.popen("/usr/sbin/unbound-control stats_noreset")
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
