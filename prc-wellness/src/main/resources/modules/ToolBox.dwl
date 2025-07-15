%dw 2.0
fun parseType(appName) =
    if (appName matches /^((.+-)*sys(-.*)?)$/) "system" else
    if (appName matches /^((.+-)*prc(-.*)?)$/) "process" else
    if (appName matches /^((.+-)*exp(-.*)?)$/) "experience" else "unknown"

fun prettifyFlowName(flowName: String): String = do {
    var items = flowName splitBy ":"
    ---
    "[$(upper(items[0]))] $(items[1] replace "\\" with "/")" default flowName
}