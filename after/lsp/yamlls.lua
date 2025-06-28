return require('schema-companion').setup_client({
    settings = {
        yaml = {
            hover = true,
            completion = true,
            schemaStore = {
                enable = false,
                url = '',
            },
            schemas = require('schemastore').yaml.schemas({
                extra = {
                    {
                        name = 'Taskfile.yaml',
                        url = 'https://taskfile.dev/schema.json',
                        fileMatch = { 'taskfile.yml', 'taskfile.yaml' },
                        description = 'Taskfile schema',
                    },
                },
            }),
        },
    },
})
