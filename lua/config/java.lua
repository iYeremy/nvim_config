local jdtls = require("jdtls")

local home = os.getenv("HOME")
local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"
local lombok_path = jdtls_path .. "/lombok.jar"

local root_dir = require("jdtls.setup").find_root({
  ".git",
  "mvnw",
  "gradlew",
  "pom.xml",
  "build.gradle",
})

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")

local workspace_dir = vim.fn.stdpath("data")
  .. "/jdtls-workspace/"
  .. project_name

local config = {
  cmd = {
    "java",
    "-javaagent:" .. lombok_path,

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",

    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",

    "-jar", vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration", jdtls_path .. "/config_linux",
    "-data", workspace_dir,
  },

  root_dir = root_dir,
}

jdtls.start_or_attach(config)
