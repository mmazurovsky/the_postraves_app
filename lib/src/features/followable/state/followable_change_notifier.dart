import 'package:flutter/widgets.dart';
import 'package:the_postraves_app/src/dependency_injection.dart';
import 'package:the_postraves_package/dto/followable_params.dart';
import 'package:the_postraves_package/dto/followable_type.dart';
import 'package:the_postraves_package/followable/complete_entities_loader/complete_full_entities.dart';
import 'package:the_postraves_package/followable/repository/followable_repository.dart';
import 'package:the_postraves_package/models/fulls/artist_full.dart';
import 'package:the_postraves_package/models/fulls/event_full.dart';
import 'package:the_postraves_package/models/fulls/place_full.dart';
import 'package:the_postraves_package/models/fulls/unity_full.dart';
import 'package:the_postraves_package/models/interfaces/data_interfaces.dart';
import 'package:the_postraves_package/models/shorts/artist_short.dart';
import 'package:the_postraves_package/models/shorts/event_short.dart';
import 'package:the_postraves_package/models/shorts/place_short.dart';
import 'package:the_postraves_package/models/shorts/unity_short.dart';

abstract class FollowableChangeNotifier implements ChangeNotifier {
  void toggleFollow(FollowableId followableId);
  FollowableVariables? get(FollowableId followableId);
  void updateFollowablesBasedOnEventList(List<EventShort> events);
  void updateFollowablesBasedOnArtistList(List<ArtistShort> artists);
  void updateFollowablesBasedOnCompleteEvent(CompleteEventEntity event);
  void updateFollowablesBasedOnCompleteUnity(CompleteUnityEntity unity);
  void updateFollowablesBasedOnCompleteArtist(CompleteArtistEntity artist);
  void updateFollowablesBasedOnCompletePlace(CompletePlaceEntity place);
}

class FollowableChangeNotifierImpl
    with ChangeNotifier
    implements FollowableChangeNotifier {
  final Map<FollowableId, FollowableVariables> _map = {};

  @override
  void toggleFollow(FollowableId followableId) {
    final followableVariables = _map[followableId];
    if (followableVariables != null) {
      FollowableVariables? newFollowableVariables;
      if (followableVariables.isFollowed) {
        newFollowableVariables = followableVariables.copyWith(
          isFollowed: false,
          overallFollowers: followableVariables.overallFollowers - 1,
          weeklyFollowers: followableVariables.weeklyFollowers - 1,
        );
        followableId.type.getRepo().unfollowFollowable(followableId.id);
      } else {
        newFollowableVariables = followableVariables.copyWith(
          isFollowed: true,
          overallFollowers: followableVariables.overallFollowers + 1,
          weeklyFollowers: followableVariables.weeklyFollowers + 1,
        );
        followableId.type.getRepo().followFollowable(followableId.id);
      }
      _update(followableId, newFollowableVariables);
    }
  }

  void _update(FollowableId followableId, FollowableVariables variables) {
    if (_map[followableId] != variables) {
      _map[followableId] = variables;
      notifyListeners();
    }
  }

  @override
  FollowableVariables? get(FollowableId followableId) {
    return _map[followableId];
  }

  @override
  void updateFollowablesBasedOnEventList(List<EventShort> events) {
    for (var event in events) {
      _updateFollowablesBasedOnGeneralFollowable(event);
      _updateFollowablesBasedOnGeneralFollowable(event.place);
    }
  }

  @override
  void updateFollowablesBasedOnArtistList(List<ArtistShort> artists) {
    for (var artist in artists) {
      _updateFollowablesBasedOnGeneralFollowable(artist);
    }
  }

  @override
  void updateFollowablesBasedOnCompleteEvent(CompleteEventEntity event) {
    _updateFollowablesBasedOnGeneralFollowable(event.eventFull);
    _updateFollowablesBasedOnGeneralFollowable(event.eventFull.place);
    for (var unity in event.orgs) {
      _updateFollowablesBasedOnGeneralFollowable(unity);
    }
    for (var artist in event.lineup) {
      _updateFollowablesBasedOnGeneralFollowable(artist);
    }
  }

  @override
  void updateFollowablesBasedOnCompleteUnity(CompleteUnityEntity unity) {
    _updateFollowablesBasedOnGeneralFollowable(unity.unityFull);
    for (var event in unity.events) {
      _updateFollowablesBasedOnGeneralFollowable(event);
    }
    for (var artist in unity.artists) {
      _updateFollowablesBasedOnGeneralFollowable(artist);
    }
  }

  @override
  void updateFollowablesBasedOnCompletePlace(CompletePlaceEntity place) {
    _updateFollowablesBasedOnGeneralFollowable(place.placeFull);
    for (var event in place.events) {
      _updateFollowablesBasedOnGeneralFollowable(event);
    }
  }

  @override
  void updateFollowablesBasedOnCompleteArtist(CompleteArtistEntity artist) {
    _updateFollowablesBasedOnGeneralFollowable(artist.artistFull);
    for (var event in artist.events) {
      _updateFollowablesBasedOnGeneralFollowable(event);
    }
  }

  void _updateFollowablesBasedOnGeneralFollowable(
      GeneralFollowableInterface followable) {
    _updateFollowables(followable.followableId, followable.followableVariables);
  }

  void _updateFollowables(
      FollowableId followableId, FollowableVariables followableVariables) {
    final persistedVariables = get(followableId);
    if (followableVariables != persistedVariables) {
      _update(followableId, followableVariables);
    }
  }
}

extension GetRepoForFollowableType on FollowableType {
  static final _mapping = {
    FollowableType.ARTIST:
        serviceLocator<FollowableRepository<ArtistFull, ArtistShort>>(),
    FollowableType.EVENT:
        serviceLocator<FollowableRepository<EventFull, EventShort>>(),
    FollowableType.PLACE:
        serviceLocator<FollowableRepository<PlaceFull, PlaceShort>>(),
    FollowableType.UNITY:
        serviceLocator<FollowableRepository<UnityFull, UnityShort>>(),
  };

  FollowableRepository<GeneralFollowableInterface, GeneralFollowableInterface>
      getRepo() => _mapping[this]!;
}
