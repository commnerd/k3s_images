load('ext://uibutton', 'cmd_button')
trigger_mode(TRIGGER_MODE_MANUAL)

projects = str(local('find * -type d -maxdepth 1')).split("\n")

for p in projects:
    local_resource(
        'Build {p}'.format(p=p),
        cmd=['sh', '-c', 'docker build {p}'.format(p=p)],
        auto_init=False
    )