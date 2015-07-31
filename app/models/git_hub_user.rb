class GitHubUser
  include GitHub

  def initialize(client, id = nil)
    @client = client
    @id     = id
  end

  # Public
  #
  def admin_organization_memberships
    with_error_handling do
      @client.organization_memberships(state: 'active').keep_if { |membership| membership.role == 'admin' }
    end
  end
