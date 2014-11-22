require 'docker'

module DockerTdd
    class Container
        def initialize(name, options= {})
            @name = name
            @container = Docker::Container.create('Image' => name, 'Cmd' => options[:args])
        end

        def start
            @container.start
        end

        def stop
            @container.kill
            @container.delete(:force => true)
        end

        def address
            @container.json['NetworkSettings']['IPAddress']
        end
    end
end
