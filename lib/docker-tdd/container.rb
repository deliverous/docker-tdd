require 'docker'

module DockerTdd
    class Container
        attr_reader :boottime
        attr_reader :name

        def initialize(name, options= {})
            @name = name
            @args = options[:args] || []
            @env = options[:env] || []
            @container = Docker::Container.create('Image' => name, 'Cmd' => @args, 'Env' => @env)
            @boottime = options[:boottime] || 0
        end

        def start
            @container.start
        end

        def stop
            @container.kill
            @container.delete(:force => true)
        end

        def running?
            @container.json['State']['Running'] == true
        end

        def address
            @container.json['NetworkSettings']['IPAddress']
        end

        def json
            @container.json
        end
    end
end
