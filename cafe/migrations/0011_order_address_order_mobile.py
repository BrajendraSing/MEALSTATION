# Generated by Django 4.0.4 on 2022-05-12 14:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cafe', '0010_alter_carousel_message_order'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='address',
            field=models.CharField(blank=True, default='', max_length=100),
        ),
        migrations.AddField(
            model_name='order',
            name='mobile',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
    ]
