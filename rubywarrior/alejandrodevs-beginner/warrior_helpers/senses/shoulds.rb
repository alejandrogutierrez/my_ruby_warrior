module WarriorHelpers
  module Senses
    module Shoulds

      def should_pivot?
        only_wall? || there_captives?(:backward)
      end

      def should_retire?
        dying? && !can_kill_it? && danger?
      end

      def should_rest?
        !enemy?(0) && !health_necessary? && !can_kill_it?
      end

      def should_shoot?
        nothing?(0) && ((wizard?(1) || (nothing?(1) && shooter?(2))) ||
        ((sludges?(1) ? @shoots <= (small_sludge?(1) ? 0 : 6) : false) && !there_archers?(:backward) ))
      end

      def should_walk?
        feel.empty? && !should_shoot?
      end

      def should_attack?
        feel.enemy?
      end

      def should_rescue?
        feel.captive?
      end

    end
  end
end
