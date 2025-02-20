# frozen_string_literal: true

class OIDC::RubygemTrustedPublishers::NewView < ApplicationView
  include Phlex::Rails::Helpers::ContentFor
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::OptionsForSelect
  include Phlex::Rails::Helpers::SelectTag
  include OIDC::RubygemTrustedPublishers::Concerns::Title

  prop :rubygem_trusted_publisher, reader: :public

  def view_template
    title_content

    div(class: "t-body") do
      form_with(
        model: rubygem_trusted_publisher,
        url: rubygem_trusted_publishers_path(rubygem_trusted_publisher.rubygem.slug),
        data: { controller: "foo" }
      ) do |f|
        f.label :trusted_publisher_type, class: "form__label"
        f.select :trusted_publisher_type, [["GitHub","github"],["Buildkite","buildkite"]], {},
          data: {foo_target: "select"},
          class: "form__input form__select"
          #OIDC::TrustedPublisher.all.map { |type|
          #                                  [type.publisher_name, type.polymorphic_name]
          #                                }, {}, class: "form__input form__select"

        div(data: {foo_target: "fieldset", key: "github"}) do
          render OIDC::TrustedPublisher::GitHubAction::FormComponent.new(
            github_action_form: f
          )
        end
        div(data: {foo_target: "fieldset", key: "buildkite"}) do
          "Buildkite"
        end
        f.submit class: "form__submit"
      end
    end
  end

  delegate :rubygem, to: :rubygem_trusted_publisher
end
