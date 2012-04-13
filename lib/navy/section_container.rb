module Navy
  module SectionContainer

    attr_accessor :block_args

    def sections(context)
      @sections ||= {}
      @sections[context] ||=
        if children?
          SectionParser.new(context).parse(block_args || [], &@children).sections
        else
          []
        end
    end

    def children?
      @children.present?
    end

  end
end
