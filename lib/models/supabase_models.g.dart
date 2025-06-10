// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gift _$GiftFromJson(Map<String, dynamic> json) => Gift(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  tokens: json['tokens'] as num,
  isPopular: json['is_popular'] as bool,
  isFeatured: json['is_featured'] as bool,
  isQuick: json['is_quick'] as bool,
  isNew: json['is_new'] as bool,
  themeColor: json['theme_color'] as String,
  category: json['category'] as String?,
  maxDailyLimit: json['max_daily_limit'] as num?,
  cooldownHours: json['cooldown_hours'] as num?,
);

Map<String, dynamic> _$GiftToJson(Gift instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'image': instance.image,
  'tokens': instance.tokens,
  'is_popular': instance.isPopular,
  'is_featured': instance.isFeatured,
  'is_quick': instance.isQuick,
  'is_new': instance.isNew,
  'theme_color': instance.themeColor,
  'category': instance.category,
  'max_daily_limit': instance.maxDailyLimit,
  'cooldown_hours': instance.cooldownHours,
};

GiftSent _$GiftSentFromJson(Map<String, dynamic> json) => GiftSent(
  id: json['id'] as String,
  gifter: json['gifter'] as String,
  recipient: json['recipient'] as String,
  gift: json['gift'] as String?,
  wishlistId: json['wishlist_id'] as String?,
  isWishlist: json['is_wishlist'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  tokensUsed: json['tokens_used'] as num?,
);

Map<String, dynamic> _$GiftSentToJson(GiftSent instance) => <String, dynamic>{
  'id': instance.id,
  'gifter': instance.gifter,
  'recipient': instance.recipient,
  'gift': instance.gift,
  'wishlist_id': instance.wishlistId,
  'is_wishlist': instance.isWishlist,
  'created_at': instance.createdAt.toIso8601String(),
  'tokens_used': instance.tokensUsed,
};

Wishlist _$WishlistFromJson(Map<String, dynamic> json) => Wishlist(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  link: json['link'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  tokens: json['tokens'] as num,
  isFulfilled: json['is_fulfilled'] as bool?,
  contributorsCount: json['contributors_count'] as num?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$WishlistToJson(Wishlist instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'link': instance.link,
  'name': instance.name,
  'description': instance.description,
  'image': instance.image,
  'tokens': instance.tokens,
  'is_fulfilled': instance.isFulfilled,
  'contributors_count': instance.contributorsCount,
  'created_at': instance.createdAt?.toIso8601String(),
};

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  email: json['email'] as String,
  username: json['username'] as String,
  name: json['name'] as String,
  bio: json['bio'] as String,
  image: json['image'] as String,
  followersCount: json['followers_count'] as num,
  followingCount: json['following_count'] as num,
  isFollowing: json['is_following'] as bool,
  gifterLevel: json['gifter_level'] as num,
  gifterLevelName: json['gifter_level_name'] as String,
  giftsSent: json['gifts_sent'] as num,
  tokenBalance: json['token_balance'] as num?,
  tokensSent: json['tokens_sent'] as num?,
  tokensReceived: json['tokens_received'] as num?,
  giftsReceived: json['gifts_received'] as num?,
  achievements: (json['achievements'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  lastSignedIn: json['last_signed_in'] == null
      ? null
      : DateTime.parse(json['last_signed_in'] as String),
  lastSignedInLocation: json['last_signed_in_location'] as String?,
  phone: json['phone'] as String?,
  gender: json['gender'] as String?,
  birthday: json['birthday'] as String?,
  location: json['location'] as String?,
  instagram: json['instagram'] as String?,
  tiktok: json['tiktok'] as String?,
  twitter: json['twitter'] as String?,
  role: json['role'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'email': instance.email,
  'username': instance.username,
  'name': instance.name,
  'bio': instance.bio,
  'image': instance.image,
  'followers_count': instance.followersCount,
  'following_count': instance.followingCount,
  'is_following': instance.isFollowing,
  'gifter_level': instance.gifterLevel,
  'gifter_level_name': instance.gifterLevelName,
  'gifts_sent': instance.giftsSent,
  'token_balance': instance.tokenBalance,
  'tokens_sent': instance.tokensSent,
  'tokens_received': instance.tokensReceived,
  'gifts_received': instance.giftsReceived,
  'achievements': instance.achievements,
  'last_signed_in': instance.lastSignedIn?.toIso8601String(),
  'last_signed_in_location': instance.lastSignedInLocation,
  'phone': instance.phone,
  'gender': instance.gender,
  'birthday': instance.birthday,
  'location': instance.location,
  'instagram': instance.instagram,
  'tiktok': instance.tiktok,
  'twitter': instance.twitter,
  'role': instance.role,
  'created_at': instance.createdAt?.toIso8601String(),
};

AuthLog _$AuthLogFromJson(Map<String, dynamic> json) => AuthLog(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  device: json['device'] as String,
  ipAddress: json['ip_address'] as String,
  provider: json['provider'] as String,
  location: json['location'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$AuthLogToJson(AuthLog instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'device': instance.device,
  'ip_address': instance.ipAddress,
  'provider': instance.provider,
  'location': instance.location,
  'created_at': instance.createdAt.toIso8601String(),
};

GifterLevel _$GifterLevelFromJson(Map<String, dynamic> json) => GifterLevel(
  id: json['id'] as String,
  level: json['level'] as num,
  name: json['name'] as String,
  minTokens: json['min_tokens'] as num,
  maxTokens: json['max_tokens'] as num,
  image: json['image'] as String,
  description: json['description'] as String,
  perks: json['perks'] as String,
  isDefault: json['is_default'] as bool,
);

Map<String, dynamic> _$GifterLevelToJson(GifterLevel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'name': instance.name,
      'min_tokens': instance.minTokens,
      'max_tokens': instance.maxTokens,
      'image': instance.image,
      'description': instance.description,
      'perks': instance.perks,
      'is_default': instance.isDefault,
    };

Occasion _$OccasionFromJson(Map<String, dynamic> json) => Occasion(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  startDate: DateTime.parse(json['start_date'] as String),
  endDate: DateTime.parse(json['end_date'] as String),
  isPrivate: json['is_private'] as bool,
  isActive: json['is_active'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$OccasionToJson(Occasion instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'title': instance.title,
  'description': instance.description,
  'start_date': instance.startDate.toIso8601String(),
  'end_date': instance.endDate.toIso8601String(),
  'is_private': instance.isPrivate,
  'is_active': instance.isActive,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

WishlistContribution _$WishlistContributionFromJson(
  Map<String, dynamic> json,
) => WishlistContribution(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  contributorId: json['contributor_id'] as String,
  wishlistId: json['wishlist_id'] as String,
  giftId: json['gift_id'] as String?,
  tokens: json['tokens'] as num,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$WishlistContributionToJson(
  WishlistContribution instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'contributor_id': instance.contributorId,
  'wishlist_id': instance.wishlistId,
  'gift_id': instance.giftId,
  'tokens': instance.tokens,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

TokenTransaction _$TokenTransactionFromJson(Map<String, dynamic> json) =>
    TokenTransaction(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      transactionType: json['transaction_type'] as String,
      tokens: json['tokens'] as num,
      kesAmount: json['kes_amount'] as num,
      flutterwaveTransactionId: json['flutterwave_transaction_id'] as String,
      flutterwaveTransactionStatus:
          json['flutterwave_transaction_status'] as String,
      referenceId: json['reference_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$TokenTransactionToJson(TokenTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'transaction_type': instance.transactionType,
      'tokens': instance.tokens,
      'kes_amount': instance.kesAmount,
      'flutterwave_transaction_id': instance.flutterwaveTransactionId,
      'flutterwave_transaction_status': instance.flutterwaveTransactionStatus,
      'reference_id': instance.referenceId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

Follow _$FollowFromJson(Map<String, dynamic> json) => Follow(
  id: json['id'] as String,
  followedId: json['followed_id'] as String,
  followerId: json['follower_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$FollowToJson(Follow instance) => <String, dynamic>{
  'id': instance.id,
  'followed_id': instance.followedId,
  'follower_id': instance.followerId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      type: json['type'] as String,
      referenceId: json['reference_id'] as String?,
      message: json['message'] as String,
      isRead: json['is_read'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      senderId: json['sender_id'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'type': instance.type,
      'reference_id': instance.referenceId,
      'message': instance.message,
      'is_read': instance.isRead,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'sender_id': instance.senderId,
    };

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
  id: json['id'] as String,
  reporterId: json['reporter_id'] as String,
  reportedId: json['reported_id'] as String,
  type: json['type'] as String,
  reason: json['reason'] as String,
  status: json['status'] as String,
  description: json['description'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
  'id': instance.id,
  'reporter_id': instance.reporterId,
  'reported_id': instance.reportedId,
  'type': instance.type,
  'reason': instance.reason,
  'status': instance.status,
  'description': instance.description,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

AdminAction _$AdminActionFromJson(Map<String, dynamic> json) => AdminAction(
  id: json['id'] as String,
  adminId: json['admin_id'] as String,
  targetUserId: json['target_user_id'] as String,
  actionType: json['action_type'] as String,
  actionId: json['action_id'] as String,
  reason: json['reason'] as String,
  status: json['status'] as String,
  notes: json['notes'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$AdminActionToJson(AdminAction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'admin_id': instance.adminId,
      'target_user_id': instance.targetUserId,
      'action_type': instance.actionType,
      'action_id': instance.actionId,
      'reason': instance.reason,
      'status': instance.status,
      'notes': instance.notes,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

TopGifter _$TopGifterFromJson(Map<String, dynamic> json) => TopGifter(
  userId: json['user_id'] as String,
  username: json['username'] as String,
  image: json['image'] as String,
  giftsSent: json['gifts_sent'] as num,
  tokensSent: json['tokens_sent'] as num,
  gifterLevel: json['gifter_level'] as num,
  gifterLevelName: json['gifter_level_name'] as String,
  largestGiftName: json['largest_gift_name'] as String,
  largestGiftId: json['largest_gift_id'] as String,
  largestGiftColor: json['largest_gift_color'] as String,
  largestGiftTokens: json['largest_gift_tokens'] as num,
  badge: json['badge'] as String,
);

Map<String, dynamic> _$TopGifterToJson(TopGifter instance) => <String, dynamic>{
  'user_id': instance.userId,
  'username': instance.username,
  'image': instance.image,
  'gifts_sent': instance.giftsSent,
  'tokens_sent': instance.tokensSent,
  'gifter_level': instance.gifterLevel,
  'gifter_level_name': instance.gifterLevelName,
  'largest_gift_name': instance.largestGiftName,
  'largest_gift_id': instance.largestGiftId,
  'largest_gift_color': instance.largestGiftColor,
  'largest_gift_tokens': instance.largestGiftTokens,
  'badge': instance.badge,
};

RecentGift _$RecentGiftFromJson(Map<String, dynamic> json) => RecentGift(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  isWishlist: json['is_wishlist'] as bool,
  wishlistId: json['wishlist_id'] as String?,
  tokensUsed: json['tokens_used'] as num,
  giftId: json['gift_id'] as String,
  giftName: json['gift_name'] as String,
  giftImage: json['gift_image'] as String,
  giftThemeColor: json['gift_theme_color'] as String,
  gifterId: json['gifter_id'] as String,
  gifterUsername: json['gifter_username'] as String,
  gifterImage: json['gifter_image'] as String,
  gifterLevel: json['gifter_level'] as num,
  gifterLevelName: json['gifter_level_name'] as String,
  recieverId: json['reciever_id'] as String,
  receiverUsername: json['receiver_username'] as String,
  wishlistName: json['wishlist_name'] as String?,
  wishlistOwnerId: json['wishlist_owner_id'] as String?,
);

Map<String, dynamic> _$RecentGiftToJson(RecentGift instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'is_wishlist': instance.isWishlist,
      'wishlist_id': instance.wishlistId,
      'tokens_used': instance.tokensUsed,
      'gift_id': instance.giftId,
      'gift_name': instance.giftName,
      'gift_image': instance.giftImage,
      'gift_theme_color': instance.giftThemeColor,
      'gifter_id': instance.gifterId,
      'gifter_username': instance.gifterUsername,
      'gifter_image': instance.gifterImage,
      'gifter_level': instance.gifterLevel,
      'gifter_level_name': instance.gifterLevelName,
      'reciever_id': instance.recieverId,
      'receiver_username': instance.receiverUsername,
      'wishlist_name': instance.wishlistName,
      'wishlist_owner_id': instance.wishlistOwnerId,
    };

WithdrawalRequest _$WithdrawalRequestFromJson(Map<String, dynamic> json) =>
    WithdrawalRequest(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      tokens: json['tokens'] as num,
      kesAmount: json['kes_amount'] as num,
      targetCurrency: json['target_currency'] as String,
      exchangeRate: json['exchange_rate'] as num,
      convertedAmount: json['converted_amount'] as num,
      status: json['status'] as String,
      rejectionReason: json['rejection_reason'] as String?,
      paymentMethod: json['payment_method'] as String,
      paymentDetails: json['payment_details'],
      processedBy: json['processed_by'] as String?,
      processedAt: json['processed_at'] == null
          ? null
          : DateTime.parse(json['processed_at'] as String),
      transactionReference: json['transaction_reference'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$WithdrawalRequestToJson(WithdrawalRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'tokens': instance.tokens,
      'kes_amount': instance.kesAmount,
      'target_currency': instance.targetCurrency,
      'exchange_rate': instance.exchangeRate,
      'converted_amount': instance.convertedAmount,
      'status': instance.status,
      'rejection_reason': instance.rejectionReason,
      'payment_method': instance.paymentMethod,
      'payment_details': instance.paymentDetails,
      'processed_by': instance.processedBy,
      'processed_at': instance.processedAt?.toIso8601String(),
      'transaction_reference': instance.transactionReference,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

Attachment _$AttachmentFromJson(Map<String, dynamic> json) =>
    Attachment(url: json['url'] as String, type: json['type'] as String);

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{'url': instance.url, 'type': instance.type};

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
  id: json['id'] as String,
  senderId: json['sender_id'] as String,
  receiverId: json['receiver_id'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'id': instance.id,
  'sender_id': instance.senderId,
  'receiver_id': instance.receiverId,
  'content': instance.content,
  'created_at': instance.createdAt.toIso8601String(),
  'attachments': instance.attachments,
};

ConversationOverview _$ConversationOverviewFromJson(
  Map<String, dynamic> json,
) => ConversationOverview(
  userA: json['user_a'] as String,
  userB: json['user_b'] as String,
  lastMessageAt: DateTime.parse(json['last_message_at'] as String),
);

Map<String, dynamic> _$ConversationOverviewToJson(
  ConversationOverview instance,
) => <String, dynamic>{
  'user_a': instance.userA,
  'user_b': instance.userB,
  'last_message_at': instance.lastMessageAt.toIso8601String(),
};

StatsTrend _$StatsTrendFromJson(Map<String, dynamic> json) =>
    StatsTrend(day: json['day'] as String, count: json['count'] as num);

Map<String, dynamic> _$StatsTrendToJson(StatsTrend instance) =>
    <String, dynamic>{'day': instance.day, 'count': instance.count};

StatsLocation _$StatsLocationFromJson(Map<String, dynamic> json) =>
    StatsLocation(
      location: json['location'] as String,
      count: json['count'] as num,
    );

Map<String, dynamic> _$StatsLocationToJson(StatsLocation instance) =>
    <String, dynamic>{'location': instance.location, 'count': instance.count};

UserStats _$UserStatsFromJson(Map<String, dynamic> json) => UserStats(
  trends: (json['trends'] as List<dynamic>)
      .map((e) => StatsTrend.fromJson(e as Map<String, dynamic>))
      .toList(),
  locations: (json['locations'] as List<dynamic>)
      .map((e) => StatsLocation.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserStatsToJson(UserStats instance) => <String, dynamic>{
  'trends': instance.trends,
  'locations': instance.locations,
};

PaginatedUsers _$PaginatedUsersFromJson(Map<String, dynamic> json) =>
    PaginatedUsers(
      users: (json['users'] as List<dynamic>)
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as num,
      page: json['page'] as num,
      perPage: json['perPage'] as num,
    );

Map<String, dynamic> _$PaginatedUsersToJson(PaginatedUsers instance) =>
    <String, dynamic>{
      'users': instance.users,
      'total': instance.total,
      'page': instance.page,
      'perPage': instance.perPage,
    };

Post _$PostFromJson(Map<String, dynamic> json) => Post(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  content: json['content'] as String?,
  quotePostId: json['quote_post_id'] as String?,
  replyCommentId: json['reply_comment_id'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  profile: json['profile'] == null
      ? null
      : Profile.fromJson(json['profile'] as Map<String, dynamic>),
  media: (json['media'] as List<dynamic>?)
      ?.map((e) => PostMedia.fromJson(e as Map<String, dynamic>))
      .toList(),
  reactionCounts: (json['reaction_counts'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as num),
  ),
  tags: (json['tags'] as List<dynamic>?)
      ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'content': instance.content,
  'quote_post_id': instance.quotePostId,
  'reply_comment_id': instance.replyCommentId,
  'created_at': instance.createdAt.toIso8601String(),
  'profile': instance.profile,
  'media': instance.media,
  'reaction_counts': instance.reactionCounts,
  'tags': instance.tags,
};

PostMedia _$PostMediaFromJson(Map<String, dynamic> json) => PostMedia(
  id: json['id'] as String,
  postId: json['post_id'] as String,
  mediaType: json['media_type'] as String,
  url: json['url'] as String,
  order: json['order'] as num,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$PostMediaToJson(PostMedia instance) => <String, dynamic>{
  'id': instance.id,
  'post_id': instance.postId,
  'media_type': instance.mediaType,
  'url': instance.url,
  'order': instance.order,
  'created_at': instance.createdAt.toIso8601String(),
};

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
  id: json['id'] as String,
  postId: json['post_id'] as String,
  userId: json['user_id'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  profile: json['profile'] == null
      ? null
      : Profile.fromJson(json['profile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
  'id': instance.id,
  'post_id': instance.postId,
  'user_id': instance.userId,
  'content': instance.content,
  'created_at': instance.createdAt.toIso8601String(),
  'profile': instance.profile,
};

PostReaction _$PostReactionFromJson(Map<String, dynamic> json) => PostReaction(
  id: json['id'] as String,
  postId: json['post_id'] as String,
  userId: json['user_id'] as String,
  type: json['type'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$PostReactionToJson(PostReaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'user_id': instance.userId,
      'type': instance.type,
      'created_at': instance.createdAt.toIso8601String(),
    };

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
  id: json['id'] as String,
  name: json['name'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'created_at': instance.createdAt.toIso8601String(),
};

PostTag _$PostTagFromJson(Map<String, dynamic> json) =>
    PostTag(postId: json['post_id'] as String, tagId: json['tag_id'] as String);

Map<String, dynamic> _$PostTagToJson(PostTag instance) => <String, dynamic>{
  'post_id': instance.postId,
  'tag_id': instance.tagId,
};
