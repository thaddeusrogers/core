default["bootstrap"]["tracedir"] = "/var/cache/rebar-bootstrap"
default["bootstrap"]["rebar_yml"]= "/opt/digitalrebar/core/rebar.yml"
default["bootstrap"]["sledgehammer"]["url"] = "http://opencrowbar.s3-website-us-east-1.amazonaws.com/sledgehammer"
#default["bootstrap"]["sledgehammer"]["signature"] = "0f61af2f6be9288d5529e15aa223e036730a8387"
# Includes lldpd for link layer switch detection.
#default["bootstrap"]["sledgehammer"]["signature"] = "6bce86d4f5c50f8be7493f2d9ec23075845ea4b9"
# Includes vconfig, which I was not including for some derpy reason.
#default["bootstrap"]["sledgehammer"]["signature"] = "69336fba18038fd931b19358eccdc87f40b80c79"
# Includes jq, needed for the scriptjig attr handling change
default["bootstrap"]["sledgehammer"]["signature"] = "20d2dccd4ea335acd7fb2b9dd5b644518ed3dbcb"
default["bootstrap"]["tftproot"] = "/tftpboot"
default["bootstrap"]["gopath"] = "/root/go"
default["bootstrap"]["gover"] = "1.4"
default["bootstrap"]["goiardi"]["repo"] = "github.com/ctdk/goiardi"
default["bootstrap"]["goiardi"]["version"] = "v0.10.0"
default["bootstrap"]["goiardi"]["port"] = 4646
default["bootstrap"]["goiardi"]["protocol"] = "http"
default["bootstrap"]["sws"] = "github.com/VictorLowther/sws"
default["bootstrap"]["openwsman"]["repo"]="https://github.com/openwsman/openwsman"
default["bootstrap"]["openwsman"]["version"]="v2.4.12"
default["bootstrap"]["dnsmgmt"] = "github.com/rackn/rebar-dns-mgmt"
default["bootstrap"]["cli"]["repo"] = "github.com/digitalrebar/rebar-api/rebar"
