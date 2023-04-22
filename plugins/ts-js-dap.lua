return { {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
        handlers = {
            node2 = function(source_name)
                local dap = require "dap"
                dap.adapters.node2 = {
                    type = "executable",
                    command = "node",
                    args = { "--inspect",
                        vim.env.HOME .. "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" }
                }

                vim.g.ts_build = function()
                    local cmd = 'npx tsc'
                    local f = os.execute(cmd)
                    if f == 0 then
                        print('\nBuild: ✔️ ')
                    else
                        print('\nBuild: ❌ (code: ' .. f .. ')')
                    end
                end
                
                -- Typescript

                -- This does not work, if you have any exported functions in the file
                local ts_config = {
                    name = 'ts current',
                    type = 'node2',
                    request = 'launch',
                    cwd = vim.fn.getcwd(),
                    outFiles = { "${fileDirname}/../build/dist/**/*.js" },
                    sourceMaps = true,
                    program = function()
                        vim.g.ts_build()
                        return '${file}'
                    end
                }

                -- Does not work, if you run a test file without any functions imported from the normal .ts files
                -- With sourceMaps = true and a path, breakpoints don't work.
                -- Seems to work but everytime there's an error in the top right
                local ts_jest_config = { 
                    name = 'ts jest current',
                    type = 'node2',
                    request = 'launch',
                    cwd = vim.fn.getcwd(),
                    program = function()
                    --     -- if vim.fn.confirm('Build project?', '&yes\n&no', 2) == 1 then
                            -- vim.g.ts_build()
                    --     -- end
                        return "${workspaceFolder}/node_modules/jest/bin/jest"         
                    end,
                    args = { 
                        "{file}",
                        "--runInBand",
                        "--coverage=false",
                    },
                }

               
                dap.configurations.typescript =
                { ts_jest_config, ts_config }

                -- Javascript
                local js_config = {
                    name = 'js current',
                    type = 'node2',
                    request = 'launch',
                    program = '${file}',
                    cwd = vim.fn.getcwd(),
                    sourceMaps = true,
                    protocol = 'inspector',
                    console = 'integratedTerminal'
                } 

                dap.configurations.javascript = { js_config }
            end,



            -- launch.json settings made into dap config syntax. Doesn't work 100%.
                -- Jest doesn't work at all, and setup init gives errors but does actually work despite that.
                --
                -- Its possible to just import a launch.json using the same syntax as VSCode. ':h dap-launch.json' for more details
                -- NORMAL TS DEBUG CONF
                -- {
                --     type = "node2",
                --     name = "vscode-jest-tests",
                --     request = "launch",
                --     args = {"--runInBand", "--coverage=false"},
                --     cwd = "${workspaceFolder}",;
                --     console = "integratedTerminal",
                --     internalConsoleOptions = "neverOpen",
                --     program = "${workspaceFolder}/node_modules/jest/bin/jest"
                -- }, {
                --     name = "setup init",
                --     type = "node2",
                --     request = "launch",
                --     protocol = "inspector",
                --     cwd = "${workspaceFolder}",
                --     preLaunchTask = "npm: build:js",
                --     outFiles = {"${workspaceFolder}/build/dist/**/**.js"},
                --     program = "${workspaceFolder}/bin/setup.ts",
                --     sourceMaps = true,
                --     args = {"init"},
                --     env = {
                --         TEMPLATES_PATH = "${workspaceFolder}/templates"
                --     },
                --     internalConsoleOptions = "openOnSessionStart"
                -- }
                -- }
                
                -- CURRENT JEST DEBUG CONF
                -- {
                --               "type": "node",
                --               "request": "launch",
                --               "name": "Jest Current",
                --               "cwd": "${workspaceFolder}",
                --               "skipFiles": [
                --                 "${workspaceFolder}/node_modules/**/*.js",
                --                 "${workspaceFolder}/lib/**/*.js",
                --                 "<node_internals>/**/*.js" ],
                --               // "preLaunchTask": "tsc: build - tsconfig.json",
                --               "args": [
                --                 "${workspaceRoot}/node_modules/.bin/jest",
                --                 // "--forceExit",
                --                 // "--detectOpenHandles",
                --                 "${relativeFile}",
                --                 "--runInBand",
                --               ],
                --               "console": "integratedTerminal",
                --               "autoAttachChildProcesses": false // Set to true for avoiding "Debugger attached." text which breaks some commands, this does however make the debugger not work.
                --             },
        }
    }             
} }
