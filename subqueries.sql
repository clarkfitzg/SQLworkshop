select AVG(close) from daily_share_prices WHERE ticker = 'NFLX';

select * FROM daily_share_prices WHERE close > (select AVG(close) from daily_share_prices WHERE ticker = 'NFLX');
