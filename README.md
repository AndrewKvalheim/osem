This branch is a preview of [OSEM] with several prospective changes applied
(checked when no longer necessary):

- [x] ~~Explicitly configure database authentication in Docker Compose [#2640](https://github.com/openSUSE/osem/pull/2640)~~ Ignored
- [x] ~~Use version range instead of OSEM_RUBY_VERSION. [#2646](https://github.com/openSUSE/osem/pull/2646)~~ Ignored
- [x] Install missing test dependency in base image [#2647](https://github.com/openSUSE/osem/pull/2647)
- [x] Resolve conflict between WebMock and Webdrivers [#2648](https://github.com/openSUSE/osem/pull/2648)
- [x] ~~Work around ChromeDriver/Chromium crash [#2649](https://github.com/openSUSE/osem/pull/2649)~~ Ignored
- [x] Decouple tests from unspecified data ordering [#2650](https://github.com/openSUSE/osem/pull/2650)
- [x] Decouple tests from unspecified data ordering (part 2) [#2652](https://github.com/openSUSE/osem/pull/2652)
- [ ] Fix access to the version history of organization-level roles [#2654](https://github.com/openSUSE/osem/pull/2654)
- [x] Ignore schema.rb in RuboCop [#2655](https://github.com/openSUSE/osem/pull/2655)
- [x] Fix bug in UserDatatable query affecting PostgreSQL [#2656](https://github.com/openSUSE/osem/pull/2656)
- [x] Remove superfluous click to display Markdown editor [#2657](https://github.com/openSUSE/osem/pull/2657)
- [x] Fix bug in logging of screenshots of failed tests [#2658](https://github.com/openSUSE/osem/pull/2658)
- [x] Use Rails transactional tests [#2659](https://github.com/openSUSE/osem/pull/2659)
- [x] Fix bug in test of animated form [#2662](https://github.com/openSUSE/osem/pull/2662)
- [x] Update Docker Compose file format: 2.0 → 2.4 (minor) [#2663](https://github.com/openSUSE/osem/pull/2663)
- [x] Annotate past migrations with Rails version [#2665](https://github.com/openSUSE/osem/pull/2665)
- [x] Fix migration that fails on conferences without pictures [#2666](https://github.com/openSUSE/osem/pull/2666)
- [x] Work around bug in migrations to non-null columns [#2667](https://github.com/openSUSE/osem/pull/2667)
- [x] Serve precompiled assets in example Docker Compose configuration [#2673](https://github.com/openSUSE/osem/pull/2673)
- [x] ~~Constrain Docker base image to openSUSE Leap 15.1 [#2697](https://github.com/openSUSE/osem/pull/2697)~~ No longer applicable
- [x] Update omniauth: 1.9.0 → 1.9.1 (patch) [#2698](https://github.com/openSUSE/osem/pull/2698)
- [x] Allow leaving OSEM_SMTP_DOMAIN unset [#2702](https://github.com/openSUSE/osem/pull/2702)
- [x] Remove race condition in test of splash page versioning [#2703](https://github.com/openSUSE/osem/pull/2703)
- [x] ~~Update Ruby dependency: 2.5.8 → 2.5.9 (patch) [#2772](https://github.com/openSUSE/osem/pull/2772)~~ Rejected
- [x] Use openSUSE Registry in production Dockerfile [#2773](https://github.com/openSUSE/osem/pull/2773)
- [x] Add missing dependencies to production Docker image [#2774](https://github.com/openSUSE/osem/pull/2774)
- [x] Exclude additional files from Docker images [#2775](https://github.com/openSUSE/osem/pull/2775)
- [x] Resolve warning about testing only for specific errors [#2776](https://github.com/openSUSE/osem/pull/2776)
- [x] Use be_successful instead of be_success [#2912](https://github.com/openSUSE/osem/pull/2912)
- [x] Order rooms by name in the schedule [#2913](https://github.com/openSUSE/osem/pull/2913)
- [ ] Revert skipping of passing tests [`7f1557c`](https://github.com/AndrewKvalheim/osem/commit/7f1557cd5bc18064d601c36c5ad182e44052e776)
- [x] Update venue country name for Countries 4.2 [#2962](https://github.com/openSUSE/osem/pull/2962)
- [x] Update UserDatatable for ajax-datatables-rails 1 [#2963](https://github.com/openSUSE/osem/pull/2963)
- [x] Update tests of splashpage forms [#2964](https://github.com/openSUSE/osem/pull/2964)
- [x] Fix bug in which role assignments aren’t tracked in version history [#2965](https://github.com/openSUSE/osem/pull/2965)
- [x] Restore test of splashpage revision history [#2967](https://github.com/openSUSE/osem/pull/2967)
- [x] Re-enable skipped tests [#2968](https://github.com/openSUSE/osem/pull/2968)
- [x] Basic feature test of survey creation and response [#2969](https://github.com/openSUSE/osem/pull/2969)
- [x] Correct use of Redcarpet’s safe_links_only flag [#2970](https://github.com/openSUSE/osem/pull/2970)
- [x] Restore colors parameter of donut chart partial [#2971](https://github.com/openSUSE/osem/pull/2971)
- [x] Update datatables for ajax-datatables-rails 1 [#2972](https://github.com/openSUSE/osem/pull/2972)
- [x] Remove excessive word counts [#2973](https://github.com/openSUSE/osem/pull/2973)
- [x] Minor corrections to the form labels in email settings [#2974](https://github.com/openSUSE/osem/pull/2974)
- [x] Avoid bug in which switches always display “No” [#2976](https://github.com/openSUSE/osem/pull/2976)
- [ ] Surveys during CFP response [`survey-during-proposal`](https://github.com/AndrewKvalheim/osem/tree/survey-during-proposal)
- [ ] Add setting to disable email notifications of comments [`toggle-comment-notifications`](https://github.com/AndrewKvalheim/osem/tree/toggle-comment-notifications)

To test it:

```bash
# Update base images
docker-compose pull

# Build the application image
docker-compose build --build-arg "CONTAINER_USERID=$UID" osem

# Initialize the database
docker-compose run --rm osem bundle exec rake db:setup

# Run tests
docker-compose run --rm osem bundle exec rspec

# Clean up
docker-compose down --rmi 'all' --volumes
```

[osem]: https://github.com/openSUSE/osem
