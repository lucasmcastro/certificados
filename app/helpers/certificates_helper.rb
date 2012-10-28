module CertificatesHelper
    def slice_topics(topics)
        topics = topics.split(",")
        size = (topics.length/2.0).ceil()
        return topics.each_slice(size)
    end
end
