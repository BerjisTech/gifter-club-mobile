import 'package:flutter/material.dart';
import '../models/supabase_models.dart';
import '../services/supabase_service.dart';

/// Dashboard screen with tabs: Overview, Gifts, Wishlist, Withdrawals.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Profile? profile;
  List<RecentGift> receivedGifts = [];
  List<Wishlist> wishlist = [];
  Map<String, int> wishlistCount = {'total': 0, 'fulfilled': 0};
  List<RecentGift> recentGiftings = [];
  List<WithdrawalRequest> withdrawalRequests = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final user = await supabaseService.currentUser();
    if (user == null) return;
    final p = await supabaseService.getProfileByUserId(user.id);
    final w = await supabaseService.getWishlistByUserId(user.id);
    final wc = await supabaseService.getUserWishlistCount(user.id);
    final rg = await supabaseService.getRecentGifts(limit: 5);
    final recGifts = await supabaseService.getGiftsReceivedByUser(user.id, limit: 50);
    final wr = await supabaseService.getWithdrawalsByUser(user.id);
    setState(() {
      profile = p;
      wishlist = w;
      wishlistCount = wc;
      recentGiftings = rg;
      receivedGifts = recGifts;
      withdrawalRequests = wr;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Dashboard')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: supabaseService.signOut,
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Gifts'),
              Tab(text: 'Wishlist'),
              Tab(text: 'Withdrawals'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOverviewTab(),
            _buildGiftsTab(),
            _buildWishlistTab(),
            _buildWithdrawalsTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    final tokensReceived = profile?.tokensReceived ?? 0;
    final tokensSent = profile?.tokensSent ?? 0;
    final giftsReceived = profile?.giftsReceived ?? 0;
    final giftsSent = profile?.giftsSent ?? 0;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _overviewCard(
                icon: Icons.account_balance_wallet,
                label: 'Tokens Received',
                value: '$tokensReceived',
              ),
              _overviewCard(
                icon: Icons.send,
                label: 'Tokens Sent',
                value: '$tokensSent',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _overviewCard(
                icon: Icons.card_giftcard,
                label: 'Gifts Received',
                value: '$giftsReceived',
              ),
              _overviewCard(
                icon: Icons.card_giftcard,
                label: 'Gifts Sent',
                value: '$giftsSent',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: _overviewCard(
              icon: Icons.list,
              label: 'Wishlist Fulfilled',
              value: '${wishlistCount['fulfilled']}/${wishlistCount['total']}',
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Recent Gifts',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...recentGiftings.map((g) => ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(g.giftImage)),
                title: Text('${g.gifterUsername} sent you ${g.giftName}'),
                subtitle: Text(g.createdAt.toLocal().toString()),
              )),
        ],
      ),
    );
  }

  Widget _overviewCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 4),
            Text(value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildGiftsTab() {
    return receivedGifts.isEmpty
        ? const Center(child: Text('You have not received any gifts yet.'))
        : ListView.builder(
            itemCount: receivedGifts.length,
            itemBuilder: (context, i) {
              final g = receivedGifts[i];
              return ListTile(
                leading:
                    CircleAvatar(backgroundImage: NetworkImage(g.giftImage)),
                title: Text('${g.gifterUsername} sent you ${g.giftName}'),
                subtitle: Text(g.createdAt.toLocal().toString()),
              );
            },
          );
  }

  Widget _buildWishlistTab() {
    return wishlist.isEmpty
        ? const Center(child: Text('No wishlist items.'))
        : ListView.builder(
            itemCount: wishlist.length,
            itemBuilder: (context, i) {
              final w = wishlist[i];
              return ListTile(
                title: Text(w.name),
                subtitle: Text(w.description),
                trailing: (w.isFulfilled ?? false) ? const Icon(Icons.check) : null,
              );
            },
          );
  }

  Widget _buildWithdrawalsTab() {
    return withdrawalRequests.isEmpty
        ? const Center(child: Text('No withdrawal requests.'))
        : ListView.builder(
            itemCount: withdrawalRequests.length,
            itemBuilder: (context, i) {
              final r = withdrawalRequests[i];
              return ListTile(
                title: Text('Request: ${r.id}'),
                subtitle: Text('${r.tokens} tokens - ${r.status}'),
              );
            },
          );
  }
}