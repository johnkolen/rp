module DTHelper
  def self.included(klass)
    def klass.save_dt_from_params(&block)
      it "save from params" do |ex|
        klass = self.class.top_level_description.constantize
        p = build(:"#{klass.to_s.underscore}_sample").to_params
        x = klass.new(p)
        expect(x.save).to be true
        expect(x).to be_a klass
        expect(x.send klass.dtparent.to_s.underscore).to be_a klass.dtparent
        instance_exec x, &block if block_given?
      end
    end
  end
end
