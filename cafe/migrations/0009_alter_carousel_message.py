# Generated by Django 4.0.4 on 2022-05-07 06:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cafe', '0008_carousel_message'),
    ]

    operations = [
        migrations.AlterField(
            model_name='carousel',
            name='message',
            field=models.CharField(default='Banner Size must be * 700X350 *  (Do not change this field)', max_length=200),
        ),
    ]
