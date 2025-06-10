// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'supabase_models.g.dart';

@JsonSerializable()
class Gift {
  final String id;
  final String name;
  final String description;
  final String image;
  final num tokens;
  @JsonKey(name: 'is_popular')
  final bool isPopular;
  @JsonKey(name: 'is_featured')
  final bool isFeatured;
  @JsonKey(name: 'is_quick')
  final bool isQuick;
  @JsonKey(name: 'is_new')
  final bool isNew;
  @JsonKey(name: 'theme_color')
  final String themeColor;
  final String? category;
  @JsonKey(name: 'max_daily_limit')
  final num? maxDailyLimit;
  @JsonKey(name: 'cooldown_hours')
  final num? cooldownHours;

  Gift({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.tokens,
    required this.isPopular,
    required this.isFeatured,
    required this.isQuick,
    required this.isNew,
    required this.themeColor,
    this.category,
    this.maxDailyLimit,
    this.cooldownHours,
  });

  factory Gift.fromJson(Map<String, dynamic> json) => _$GiftFromJson(json);
  Map<String, dynamic> toJson() => _$GiftToJson(this);
}

@JsonSerializable()
class GiftSent {
  final String id;
  final String gifter;
  final String recipient;
  final String? gift;
  @JsonKey(name: 'wishlist_id')
  final String? wishlistId;
  @JsonKey(name: 'is_wishlist')
  final bool isWishlist;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'tokens_used')
  final num? tokensUsed;

  GiftSent({
    required this.id,
    required this.gifter,
    required this.recipient,
    this.gift,
    this.wishlistId,
    required this.isWishlist,
    required this.createdAt,
    this.tokensUsed,
  });

  factory GiftSent.fromJson(Map<String, dynamic> json) => _$GiftSentFromJson(json);
  Map<String, dynamic> toJson() => _$GiftSentToJson(this);
}

@JsonSerializable()
class Wishlist {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  final String link;
  final String name;
  final String description;
  final String image;
  final num tokens;
  @JsonKey(name: 'is_fulfilled')
  final bool? isFulfilled;
  @JsonKey(name: 'contributors_count')
  final num? contributorsCount;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  Wishlist({
    required this.id,
    required this.userId,
    required this.link,
    required this.name,
    required this.description,
    required this.image,
    required this.tokens,
    this.isFulfilled,
    this.contributorsCount,
    this.createdAt,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) => _$WishlistFromJson(json);
  Map<String, dynamic> toJson() => _$WishlistToJson(this);
}

@JsonSerializable()
class Profile {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  final String email;
  final String username;
  final String name;
  final String bio;
  final String image;
  @JsonKey(name: 'followers_count')
  final num followersCount;
  @JsonKey(name: 'following_count')
  final num followingCount;
  @JsonKey(name: 'is_following')
  final bool isFollowing;
  @JsonKey(name: 'gifter_level')
  final num gifterLevel;
  @JsonKey(name: 'gifter_level_name')
  final String gifterLevelName;
  @JsonKey(name: 'gifts_sent')
  final num giftsSent;
  @JsonKey(name: 'token_balance')
  final num? tokenBalance;
  @JsonKey(name: 'tokens_sent')
  final num? tokensSent;
  @JsonKey(name: 'tokens_received')
  final num? tokensReceived;
  @JsonKey(name: 'gifts_received')
  final num? giftsReceived;
  final List<String>? achievements;
  @JsonKey(name: 'last_signed_in')
  final DateTime? lastSignedIn;
  @JsonKey(name: 'last_signed_in_location')
  final String? lastSignedInLocation;
  final String? phone;
  final String? gender;
  final String? birthday;
  final String? location;
  final String? instagram;
  final String? tiktok;
  final String? twitter;
  final String? role;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  Profile({
    required this.id,
    required this.userId,
    required this.email,
    required this.username,
    required this.name,
    required this.bio,
    required this.image,
    required this.followersCount,
    required this.followingCount,
    required this.isFollowing,
    required this.gifterLevel,
    required this.gifterLevelName,
    required this.giftsSent,
    this.tokenBalance,
    this.tokensSent,
    this.tokensReceived,
    this.giftsReceived,
    this.achievements,
    this.lastSignedIn,
    this.lastSignedInLocation,
    this.phone,
    this.gender,
    this.birthday,
    this.location,
    this.instagram,
    this.tiktok,
    this.twitter,
    this.role,
    this.createdAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class AuthLog {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  final String device;
  @JsonKey(name: 'ip_address')
  final String ipAddress;
  final String provider;
  final String location;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  AuthLog({
    required this.id,
    required this.userId,
    required this.device,
    required this.ipAddress,
    required this.provider,
    required this.location,
    required this.createdAt,
  });

  factory AuthLog.fromJson(Map<String, dynamic> json) => _$AuthLogFromJson(json);
  Map<String, dynamic> toJson() => _$AuthLogToJson(this);
}

@JsonSerializable()
class GifterLevel {
  final String id;
  final num level;
  final String name;
  @JsonKey(name: 'min_tokens')
  final num minTokens;
  @JsonKey(name: 'max_tokens')
  final num maxTokens;
  final String image;
  final String description;
  final String perks;
  @JsonKey(name: 'is_default')
  final bool isDefault;

  GifterLevel({
    required this.id,
    required this.level,
    required this.name,
    required this.minTokens,
    required this.maxTokens,
    required this.image,
    required this.description,
    required this.perks,
    required this.isDefault,
  });

  factory GifterLevel.fromJson(Map<String, dynamic> json) => _$GifterLevelFromJson(json);
  Map<String, dynamic> toJson() => _$GifterLevelToJson(this);
}

@JsonSerializable()
class Occasion {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  final String title;
  final String description;
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @JsonKey(name: 'end_date')
  final DateTime endDate;
  @JsonKey(name: 'is_private')
  final bool isPrivate;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  Occasion({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isPrivate,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Occasion.fromJson(Map<String, dynamic> json) => _$OccasionFromJson(json);
  Map<String, dynamic> toJson() => _$OccasionToJson(this);
}

@JsonSerializable()
class WishlistContribution {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'contributor_id')
  final String contributorId;
  @JsonKey(name: 'wishlist_id')
  final String wishlistId;
  @JsonKey(name: 'gift_id')
  final String? giftId;
  final num tokens;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  WishlistContribution({
    required this.id,
    required this.userId,
    required this.contributorId,
    required this.wishlistId,
    this.giftId,
    required this.tokens,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WishlistContribution.fromJson(Map<String, dynamic> json) => _$WishlistContributionFromJson(json);
  Map<String, dynamic> toJson() => _$WishlistContributionToJson(this);
}

@JsonSerializable()
class TokenTransaction {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'transaction_type')
  final String transactionType;
  final num tokens;
  @JsonKey(name: 'kes_amount')
  final num kesAmount;
  @JsonKey(name: 'flutterwave_transaction_id')
  final String flutterwaveTransactionId;
  @JsonKey(name: 'flutterwave_transaction_status')
  final String flutterwaveTransactionStatus;
  @JsonKey(name: 'reference_id')
  final String referenceId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  TokenTransaction({
    required this.id,
    required this.userId,
    required this.transactionType,
    required this.tokens,
    required this.kesAmount,
    required this.flutterwaveTransactionId,
    required this.flutterwaveTransactionStatus,
    required this.referenceId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TokenTransaction.fromJson(Map<String, dynamic> json) => _$TokenTransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TokenTransactionToJson(this);
}

@JsonSerializable()
class Follow {
  final String id;
  @JsonKey(name: 'followed_id')
  final String followedId;
  @JsonKey(name: 'follower_id')
  final String followerId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  Follow({
    required this.id,
    required this.followedId,
    required this.followerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Follow.fromJson(Map<String, dynamic> json) => _$FollowFromJson(json);
  Map<String, dynamic> toJson() => _$FollowToJson(this);
}

@JsonSerializable()
class NotificationModel {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  final String type;
  @JsonKey(name: 'reference_id')
  final String? referenceId;
  final String message;
  @JsonKey(name: 'is_read')
  final bool isRead;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'sender_id')
  final String? senderId;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.type,
    this.referenceId,
    required this.message,
    required this.isRead,
    required this.createdAt,
    this.updatedAt,
    this.senderId,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

@JsonSerializable()
class Report {
  final String id;
  @JsonKey(name: 'reporter_id')
  final String reporterId;
  @JsonKey(name: 'reported_id')
  final String reportedId;
  final String type;
  final String reason;
  final String status;
  final String description;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  Report({
    required this.id,
    required this.reporterId,
    required this.reportedId,
    required this.type,
    required this.reason,
    required this.status,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

@JsonSerializable()
class AdminAction {
  final String id;
  @JsonKey(name: 'admin_id')
  final String adminId;
  @JsonKey(name: 'target_user_id')
  final String targetUserId;
  @JsonKey(name: 'action_type')
  final String actionType;
  @JsonKey(name: 'action_id')
  final String actionId;
  final String reason;
  final String status;
  final String notes;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  AdminAction({
    required this.id,
    required this.adminId,
    required this.targetUserId,
    required this.actionType,
    required this.actionId,
    required this.reason,
    required this.status,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdminAction.fromJson(Map<String, dynamic> json) => _$AdminActionFromJson(json);
  Map<String, dynamic> toJson() => _$AdminActionToJson(this);
}

@JsonSerializable()
class TopGifter {
  @JsonKey(name: 'user_id')
  final String userId;
  final String username;
  final String image;
  @JsonKey(name: 'gifts_sent')
  final num giftsSent;
  @JsonKey(name: 'tokens_sent')
  final num tokensSent;
  @JsonKey(name: 'gifter_level')
  final num gifterLevel;
  @JsonKey(name: 'gifter_level_name')
  final String gifterLevelName;
  @JsonKey(name: 'largest_gift_name')
  final String largestGiftName;
  @JsonKey(name: 'largest_gift_id')
  final String largestGiftId;
  @JsonKey(name: 'largest_gift_color')
  final String largestGiftColor;
  @JsonKey(name: 'largest_gift_tokens')
  final num largestGiftTokens;
  final String badge;

  TopGifter({
    required this.userId,
    required this.username,
    required this.image,
    required this.giftsSent,
    required this.tokensSent,
    required this.gifterLevel,
    required this.gifterLevelName,
    required this.largestGiftName,
    required this.largestGiftId,
    required this.largestGiftColor,
    required this.largestGiftTokens,
    required this.badge,
  });

  factory TopGifter.fromJson(Map<String, dynamic> json) => _$TopGifterFromJson(json);
  Map<String, dynamic> toJson() => _$TopGifterToJson(this);
}

@JsonSerializable()
class RecentGift {
  final String id;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'is_wishlist')
  final bool isWishlist;
  @JsonKey(name: 'wishlist_id')
  final String? wishlistId;
  @JsonKey(name: 'tokens_used')
  final num tokensUsed;
  @JsonKey(name: 'gift_id')
  final String giftId;
  @JsonKey(name: 'gift_name')
  final String giftName;
  @JsonKey(name: 'gift_image')
  final String giftImage;
  @JsonKey(name: 'gift_theme_color')
  final String giftThemeColor;
  @JsonKey(name: 'gifter_id')
  final String gifterId;
  @JsonKey(name: 'gifter_username')
  final String gifterUsername;
  @JsonKey(name: 'gifter_image')
  final String gifterImage;
  @JsonKey(name: 'gifter_level')
  final num gifterLevel;
  @JsonKey(name: 'gifter_level_name')
  final String gifterLevelName;
  @JsonKey(name: 'reciever_id')
  final String recieverId;
  @JsonKey(name: 'receiver_username')
  final String receiverUsername;
  @JsonKey(name: 'wishlist_name')
  final String? wishlistName;
  @JsonKey(name: 'wishlist_owner_id')
  final String? wishlistOwnerId;

  RecentGift({
    required this.id,
    required this.createdAt,
    required this.isWishlist,
    this.wishlistId,
    required this.tokensUsed,
    required this.giftId,
    required this.giftName,
    required this.giftImage,
    required this.giftThemeColor,
    required this.gifterId,
    required this.gifterUsername,
    required this.gifterImage,
    required this.gifterLevel,
    required this.gifterLevelName,
    required this.recieverId,
    required this.receiverUsername,
    this.wishlistName,
    this.wishlistOwnerId,
  });

  factory RecentGift.fromJson(Map<String, dynamic> json) => _$RecentGiftFromJson(json);
  Map<String, dynamic> toJson() => _$RecentGiftToJson(this);
}

@JsonSerializable()
class WithdrawalRequest {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  final num tokens;
  @JsonKey(name: 'kes_amount')
  final num kesAmount;
  @JsonKey(name: 'target_currency')
  final String targetCurrency;
  @JsonKey(name: 'exchange_rate')
  final num exchangeRate;
  @JsonKey(name: 'converted_amount')
  final num convertedAmount;
  final String status;
  @JsonKey(name: 'rejection_reason')
  final String? rejectionReason;
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @JsonKey(name: 'payment_details')
  final dynamic paymentDetails;
  @JsonKey(name: 'processed_by')
  final String? processedBy;
  @JsonKey(name: 'processed_at')
  final DateTime? processedAt;
  @JsonKey(name: 'transaction_reference')
  final String? transactionReference;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  WithdrawalRequest({
    required this.id,
    required this.userId,
    required this.tokens,
    required this.kesAmount,
    required this.targetCurrency,
    required this.exchangeRate,
    required this.convertedAmount,
    required this.status,
    this.rejectionReason,
    required this.paymentMethod,
    this.paymentDetails,
    this.processedBy,
    this.processedAt,
    this.transactionReference,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WithdrawalRequest.fromJson(Map<String, dynamic> json) => _$WithdrawalRequestFromJson(json);
  Map<String, dynamic> toJson() => _$WithdrawalRequestToJson(this);
}

@JsonSerializable()
class Attachment {
  final String url;
  final String type;

  Attachment({
    required this.url,
    required this.type,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);
  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}

@JsonSerializable()
class Message {
  final String id;
  @JsonKey(name: 'sender_id')
  final String senderId;
  @JsonKey(name: 'receiver_id')
  final String receiverId;
  final String content;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final List<Attachment>? attachments;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.createdAt,
    this.attachments,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class ConversationOverview {
  @JsonKey(name: 'user_a')
  final String userA;
  @JsonKey(name: 'user_b')
  final String userB;
  @JsonKey(name: 'last_message_at')
  final DateTime lastMessageAt;

  ConversationOverview({
    required this.userA,
    required this.userB,
    required this.lastMessageAt,
  });

  factory ConversationOverview.fromJson(Map<String, dynamic> json) => _$ConversationOverviewFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationOverviewToJson(this);
}

@JsonSerializable()
class StatsTrend {
  final String day;
  final num count;

  StatsTrend({required this.day, required this.count});

  factory StatsTrend.fromJson(Map<String, dynamic> json) => _$StatsTrendFromJson(json);
  Map<String, dynamic> toJson() => _$StatsTrendToJson(this);
}

@JsonSerializable()
class StatsLocation {
  final String location;
  final num count;

  StatsLocation({required this.location, required this.count});

  factory StatsLocation.fromJson(Map<String, dynamic> json) => _$StatsLocationFromJson(json);
  Map<String, dynamic> toJson() => _$StatsLocationToJson(this);
}

@JsonSerializable()
class UserStats {
  final List<StatsTrend> trends;
  final List<StatsLocation> locations;

  UserStats({required this.trends, required this.locations});

  factory UserStats.fromJson(Map<String, dynamic> json) => _$UserStatsFromJson(json);
  Map<String, dynamic> toJson() => _$UserStatsToJson(this);
}

@JsonSerializable()
class PaginatedUsers {
  final List<Profile> users;
  final num total;
  final num page;
  @JsonKey(name: 'perPage')
  final num perPage;

  PaginatedUsers({
    required this.users,
    required this.total,
    required this.page,
    required this.perPage,
  });

  factory PaginatedUsers.fromJson(Map<String, dynamic> json) => _$PaginatedUsersFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedUsersToJson(this);
}

@JsonSerializable()
class Post {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  final String? content;
  @JsonKey(name: 'quote_post_id')
  final String? quotePostId;
  @JsonKey(name: 'reply_comment_id')
  final String? replyCommentId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final Profile? profile;
  final List<PostMedia>? media;
  @JsonKey(name: 'reaction_counts')
  final Map<String, num>? reactionCounts;
  final List<Tag>? tags;

  Post({
    required this.id,
    required this.userId,
    this.content,
    this.quotePostId,
    this.replyCommentId,
    required this.createdAt,
    this.profile,
    this.media,
    this.reactionCounts,
    this.tags,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable()
class PostMedia {
  final String id;
  @JsonKey(name: 'post_id')
  final String postId;
  @JsonKey(name: 'media_type')
  final String mediaType;
  final String url;
  final num order;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  PostMedia({
    required this.id,
    required this.postId,
    required this.mediaType,
    required this.url,
    required this.order,
    required this.createdAt,
  });

  factory PostMedia.fromJson(Map<String, dynamic> json) => _$PostMediaFromJson(json);
  Map<String, dynamic> toJson() => _$PostMediaToJson(this);
}

@JsonSerializable()
class Comment {
  final String id;
  @JsonKey(name: 'post_id')
  final String postId;
  @JsonKey(name: 'user_id')
  final String userId;
  final String content;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final Profile? profile;

  Comment({
    required this.id,
    required this.postId,
    required this.userId,
    required this.content,
    required this.createdAt,
    this.profile,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

@JsonSerializable()
class PostReaction {
  final String id;
  @JsonKey(name: 'post_id')
  final String postId;
  @JsonKey(name: 'user_id')
  final String userId;
  final String type;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  PostReaction({
    required this.id,
    required this.postId,
    required this.userId,
    required this.type,
    required this.createdAt,
  });

  factory PostReaction.fromJson(Map<String, dynamic> json) => _$PostReactionFromJson(json);
  Map<String, dynamic> toJson() => _$PostReactionToJson(this);
}

@JsonSerializable()
class Tag {
  final String id;
  final String name;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  Tag({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@JsonSerializable()
class PostTag {
  @JsonKey(name: 'post_id')
  final String postId;
  @JsonKey(name: 'tag_id')
  final String tagId;

  PostTag({
    required this.postId,
    required this.tagId,
  });

  factory PostTag.fromJson(Map<String, dynamic> json) => _$PostTagFromJson(json);
  Map<String, dynamic> toJson() => _$PostTagToJson(this);
}